
import SwiftUI

struct PageContext: View {
    @StateObject private var user = UserState(id: 1, username: "unicorn42", email: "unicorn42@example.com")

    var body: some View {
        VStack(spacing: 20) {
            Text("Welcome back, \(user.username)")
                .font(.largeTitle)

            UserProfile2()
                .environmentObject(user)
        }
        .padding()
    }
}