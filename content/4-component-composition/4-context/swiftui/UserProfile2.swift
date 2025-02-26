import SwiftUI

struct UserProfile2: View {
    @EnvironmentObject var user: UserState

    var body: some View {
        VStack(spacing: 10) {
            Text("My Profile")
                .font(.headline)

            Text("Username: \(user.username)")
            Text("Email: \(user.email)")

            Button(action: {
                user.username = "Jane" // ✅ 更新 `username`
            }) {
                Text("Update username to Jane")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
}