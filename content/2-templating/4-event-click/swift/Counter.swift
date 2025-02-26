import SwiftUI

struct Counter: View {
    @State private var count = 0  

    var body: some View {
        VStack(spacing: 20) {
            Text("Counter: \(count)")  
                .font(.title)

            Button(action: incrementCount) {
                Text("+1")
                    .font(.largeTitle)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
    }

    func incrementCount() {
        count += 1
    }
}