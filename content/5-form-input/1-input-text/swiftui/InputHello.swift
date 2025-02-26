import SwiftUI

struct InputHello: View {
    @State private var text: String = "Hello World"

    var body: some View {
        VStack {
            Text(text)  
                .font(.title)
            
            TextField("Enter text", text: $text)   
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .padding()
    }
}