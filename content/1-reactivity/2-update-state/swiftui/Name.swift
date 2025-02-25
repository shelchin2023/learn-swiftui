import SwiftUI

struct Name: View {
    @State private var name: String = "John"

    var body: some View {
        VStack {
            Text("Hello \(name)")
                .font(.largeTitle)
                .padding()

            Button("Change Name") {
                name = "Jane"
            }
            .padding()
        }
    }
}