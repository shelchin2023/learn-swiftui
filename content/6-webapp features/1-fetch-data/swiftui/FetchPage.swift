import SwiftUI
import Foundation
 
struct FetchPage: View {
    @StateObject private var response = useFetchUsers()
 
    var body: some View {
        VStack {
       
            if response.isLoading {
                Text("Fetching users...")
                    .font(.headline)
            } else if let error = response.error {
                Text("An error occurred: \(error)")
                    .foregroundColor(.red)
               
            } else {
                List(response.users,id:\.id) { user in
                    HStack {
                        AsyncImage(url: URL(string: user.picture.thumbnail)) { image in
                            image.resizable()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                           
                        
                        Text("\(user.name.first) \(user.name.last)")
                            .font(.headline)
                    }
                    .padding(.vertical, 4)
                }
            }
        }
        .padding()
    }
}