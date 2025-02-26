import SwiftUI

struct FunnyButton<Content: View>: View {
    let content: Content   
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    var body: some View {    
        Button(action: {}) {
           content
        }
        .font(.title)
        .padding()
        .foregroundColor(.white)
        .background(Color.black.opacity(0.4))
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white, lineWidth: 2))
        .shadow(color: Color.black.opacity(0.4), radius: 4, x: 4, y: 4)
        .scaleEffect(0.9)
        .buttonStyle(PlainButtonStyle())  
        .animation(.spring(response: 0.2, dampingFraction: 0.65, blendDuration: 0), value: 1)
    }
}

extension FunnyButton where Content == Text {
    init() {
        self.init { Text("Default Button") }   
    }
}
