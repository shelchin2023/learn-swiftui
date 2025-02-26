import SwiftUI

struct IsAvailable: View {
    @State private var isAvailable: Bool = false

    var body: some View {
        VStack {
            Toggle("Is available", isOn: $isAvailable)  
                .padding()
        }
        .padding()
    }
}
