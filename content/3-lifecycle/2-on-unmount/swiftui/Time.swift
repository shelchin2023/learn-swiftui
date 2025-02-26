import SwiftUI

struct Time: View {
    @State private var time: String = Date().formattedTime() 
    @State private var timer: Timer?  

    var body: some View {
        Text("Current time: \(time)")
            .font(.title)
            .onAppear {
                startTimer()  
            }
            .onDisappear {
                stopTimer()  
            }
    }

    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            time = Date().formattedTime()
        }
    }

    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

extension Date {
    func formattedTime() -> String {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        return formatter.string(from: self)
    }
}