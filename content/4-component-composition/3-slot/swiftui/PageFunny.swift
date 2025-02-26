import SwiftUI

struct PageFunny: View {
    var body: some View {
        VStack {
            FunnyButton()
            FunnyButton {
                Text("Click me!")
            }
        }
    }
}