import SwiftUI

struct PageTitle: View {
    @State private var pageTitle: String = ""
    
    var body: some View {
        VStack {
            Text("Page title: \(pageTitle)")
                .font(.headline)
                .padding()
        }
        .onAppear {
            updatePageTitle()
        }
    }
    
    private func updatePageTitle() {
        pageTitle = "Default Title" 
    }
}
