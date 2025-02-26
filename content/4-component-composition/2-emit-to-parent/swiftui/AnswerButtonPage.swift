import SwiftUI

struct AnswerButtonPage: View {
    @State private var isHappy = true

    func onAnswerYes() {
        isHappy = true
    }

    func onAnswerNo() {
        isHappy = false
    }

    var body: some View {
        VStack(spacing: 20) {
            Text("Are you happy?")
                .font(.title)
 
            AnswerButton(onYes: onAnswerYes, onNo: onAnswerNo)

            Text(isHappy ? "😀" : "😥")
                .font(.system(size: 50))
        }
        .padding()
    }
}