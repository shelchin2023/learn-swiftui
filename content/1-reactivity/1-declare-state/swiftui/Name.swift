import SwiftUI

struct NameView: View {
    @State private var name: String = "John"
    
    var body: some View {
        Text("Hello \(name)")
            .font(.largeTitle)
            .padding()
    }
}

struct NameView_Previews: PreviewProvider {
    static var previews: some View {
        NameView()
    }
}