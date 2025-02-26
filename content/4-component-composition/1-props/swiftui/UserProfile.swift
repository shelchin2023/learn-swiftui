import SwiftUI

struct User {
    var name: String
    var age: Int?
    var favouriteColors: [String]
    var isAvailable: Bool
}
 
struct UserProfile: View {
    let user: User 

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("My name is \(user.name)!")  
                .font(.title2)

            Text("My age is \(user.age ?? 0)!")  
                .font(.title2)

            Text("My favourite colors are \(user.favouriteColors.joined(separator: ", "))!")  
                .font(.title2)

            Text("I am \(user.isAvailable ? "available" : "not available")")  
                .font(.title2)
                .foregroundColor(user.isAvailable ? .green : .red) 
        }
        .padding()
    }
}