import { defineConfig } from "vite";
import { svelte } from "@sveltejs/vite-plugin-svelte";
import fs from "node:fs/promises";
import path from "node:path";
import { Eta } from "eta";
import { minify as htmlMinify } from "html-minifier-terser";
import FRAMEWORKS from "./frameworks.mjs";
import pluginGenerateFrameworkContent from "./build/generateContentVitePlugin.js";
import UnoCSS from "unocss/vite";
import { svelteInspector } from "@sveltejs/vite-plugin-svelte-inspector";
// @TODO: sitemap

const footerNavigation = [];

const footerLinks = footerNavigation.map((n) => n.links).flat();

const templateDataDefaults = {
  title: "Learn SwiftUI",
  url: "https://component-party.dev/",
  description: ``,
  image: "https://component-party.dev/banner2.png",
};

// https://vitejs.dev/config/
export default defineConfig({
  plugins: [
    pluginGenerateFrameworkContent(),
    svelte(),
    svelteInspector(), // https://github.com/sveltejs/vite-plugin-svelte/blob/main/docs/inspector.md
    generateHtmlPagesPlugin([
      ...footerLinks.map((link) => ({
        outputPath: `${link.url}.html`,
        template: "dist/index.html",
        templateData: {
          ...templateDataDefaults,
          title: `${link.name} - ${templateDataDefaults.title}`,
        },
      })),
      {
        outputPath: "index.html",
        template: "dist/index.html",
        templateData: templateDataDefaults,
      },
    ]),
    UnoCSS(),
  ],
  ignore: ["content"],
});

async function generateHtmlPagesPlugin(pages) {
  const eta = new Eta({ views: "." });

  const template = {
    footer: await fs.readFile(
      path.resolve(__dirname, "build/template/footer.html"),
      "utf8"
    ),
  };

  const htmlTransform = {
    include(html) {
      for (const [templateName, templateContent] of Object.entries(template)) {
        html = html.replace(
          `<!--template:${templateName}-->`,
          eta.renderString(templateContent, { navigations: footerNavigation })
        );
      }
      return html;
    },
    render(htmlEta, data) {
      return eta.renderString(htmlEta, data);
    },
  };

  return {
    name: "generate-html-pages",
    transformIndexHtml(html, ctx) {
      html = htmlTransform.include(html);
      if (ctx.server) {
        const matchedPage = pages.find(
          (page) => ctx.originalUrl === filePathToUrl(page.outputPath)
        );
        if (matchedPage) {
          html = htmlTransform.render(html, matchedPage.templateData);
        } else {
          html = htmlTransform.render(html, templateDataDefaults);
        }
      }
      return html;
    },
    async closeBundle() {
      for (const page of pages) {
        const template = page.template || "index.html";
        const templateData = page.templateData || {};
        const templatePath = path.join(__dirname, template);
        const outputPath = path.join(__dirname, "dist", page.outputPath);

        const templateContent = await fs.readFile(templatePath, "utf8");
        const compiledHtml = eta.renderString(templateContent, templateData);
        const minifiedHtml = await htmlMinify(compiledHtml);
        const dirPath = path.dirname(outputPath);
        await fs.mkdir(dirPath, { recursive: true, force: true });
        await fs.writeFile(outputPath, minifiedHtml, "utf8");
      }
    },
  };
}

function filePathToUrl(filePath) {
  let normalizedPath = path.normalize(filePath);
  let baseName = path.basename(normalizedPath);

  if (baseName === "index.html") {
    return path.dirname(normalizedPath) === "."
      ? "/"
      : path.dirname(normalizedPath) + "/";
  } else {
    return normalizedPath.replace(/.html$/, "");
  }
}
