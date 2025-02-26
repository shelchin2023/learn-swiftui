import SwiftUI

struct AnswerButton: View {
    var onYes: () -> Void  
    var onNo: () -> Void   

    var body: some View {
        HStack(spacing: 20) {
            Button(action: onYes) {  
                Text("YES")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            Button(action: onNo) {  
                Text("NO")
                    .padding()
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}