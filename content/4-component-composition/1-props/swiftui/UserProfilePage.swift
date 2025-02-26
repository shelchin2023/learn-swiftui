import SwiftUI

struct UserProfilePage: View {
    var body: some View {
        UserProfile(user: User(
            name: "John",
            age: 20,
            favouriteColors: ["Green","Blue","Red"],
            isAvailable: true
        ))
    }
}