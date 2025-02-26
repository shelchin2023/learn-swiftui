import Foundation

@MainActor
class useFetchUsers: ObservableObject {
    @Published var users: [User2] = []
    @Published var error: String? = nil
    @Published var isLoading: Bool = false
    
    init() {
        fetchUsers()
    }
    
    func fetchUsers() {
        isLoading = true
        Task {
            do {
                let url = URL(string: "https://randomuser.me/api/?results=3")!
                let (data, _) = try await URLSession.shared.data(from: url)

                let decodedResponse = try JSONDecoder().decode(UsersAPIResponse.self, from: data)
                self.users = decodedResponse.results
                self.error = nil
 
            } catch {
                print(error)
                self.error = error.localizedDescription
                self.users = []
            }
            self.isLoading = false
        }
    }
}
struct User2: Identifiable, Decodable {
    let id = UUID()
    var name: Name
    var picture: Picture
    
    struct Name: Decodable {
        var first: String
        var last: String
    }
    
    struct Picture: Decodable {
        var thumbnail: String
    }
}

struct UsersAPIResponse: Decodable {
    var results: [User2]
}
