import SwiftUI

struct StyleButton: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("I am red")
                .font(.largeTitle)  
                .foregroundColor(.red)  
            
            Button(action: {
                print("Button Clicked!")  
            }) {
                Text("I am a button")
                    .font(.system(size: 100))  
                    .padding()
            }
        }
    }
}