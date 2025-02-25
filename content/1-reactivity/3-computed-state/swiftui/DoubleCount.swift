import SwiftUI

struct DoubleCount: View {
    @State private var count: Int = 10
    
    private var doubleCount: Int {
        count * 2
    }
    
    var body: some View {
      Text("Double Count: \(doubleCount)")
    }
}