function sortAllFilenames(files, filenamesSorted) {
  return [
    ...filenamesSorted.map((filename) =>
      files.find(({ fileName }) => fileName === filename)
    ),
    ...(files.filter(({ fileName }) => !filenamesSorted.includes(fileName)) ||
      []),
  ].filter(Boolean);
}

const frameworks = [
  {
    id: "swiftui",
    title: "Swift UI",
    frameworkName: "SwiftUI",
    isCurrentVersion: false,
    img: "framework/swiftui.svg",
    // eslint: {
    //   files: ["**/TODO-THIS-IS-DISABLED-svelte5/*.swift"],
    //   parser: "svelte-eslint-parser",
    // },
    // playgroundURL: "https://svelte-5-preview.vercel.app/",
    // documentationURL: "https://svelte-5-preview.vercel.app/docs",
    filesSorter(files) {
      console.log(files);
      return sortAllFilenames(files, ["index.html", "app.js", "App.svelte"]);
    },
    // repositoryLink: "https://github.com/sveltejs/svelte",
    mainPackageName: "swiftui",
  },
  {
    id: "svelte5",
    title: "Svelte 5",
    frameworkName: "Svelte",
    isCurrentVersion: false,
    img: "framework/svelte.svg",
    eslint: {
      files: ["**/TODO-THIS-IS-DISABLED-svelte5/*.svelte"],
      parser: "svelte-eslint-parser",
    },
    playgroundURL: "https://svelte-5-preview.vercel.app/",
    documentationURL: "https://svelte-5-preview.vercel.app/docs",
    filesSorter(files) {
      return sortAllFilenames(files, ["index.html", "app.js", "App.svelte"]);
    },
    repositoryLink: "https://github.com/sveltejs/svelte",
    mainPackageName: "svelte",
  },
  // {
  //   id: "react",
  //   title: "React",
  //   frameworkName: "React",
  //   isCurrentVersion: true,
  //   img: "framework/react.svg",
  //   eslint: {
  //     files: ["**/react/*.jsx", "**/react/*.tsx"],
  //     extends: [
  //       "eslint:recommended",
  //       "plugin:react/recommended",
  //       "plugin:react/jsx-runtime",
  //     ],
  //     settings: {
  //       react: {
  //         version: "detect",
  //       },
  //     },
  //   },
  //   playgroundURL: "https://codesandbox.io/s/mystifying-goldberg-6wx04b",
  //   documentationURL: "https://reactjs.org/docs/getting-started.html",
  //   filesSorter(files) {
  //     return sortAllFilenames(files, ["index.html", "main.jsx", "App.jsx"]);
  //   },
  //   repositoryLink: "https://github.com/facebook/react",
  //   mainPackageName: "react",
  // },
];

export function matchFrameworkId(id) {
  console.log("caocao", { id });
  return frameworks.find(
    (framework) =>
      framework.id === id ||
      (framework.isCurrentVersion &&
        framework.frameworkName.toLowerCase() === id)
  );
}

export default frameworks;
