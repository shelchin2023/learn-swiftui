import Foundation
import SwiftUI

class UserState: ObservableObject {
    @Published var username: String
    @Published var email: String

    init(id: Int, username: String, email: String) {
        self.username = username
        self.email = email
    }
}