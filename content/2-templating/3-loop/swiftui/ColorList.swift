import SwiftUI

struct ColorList: View {
    let colors = ["red", "green", "blue"] 
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            ForEach(colors, id: \.self) { color in
                Text(color)
                    .font(.title)  
                    .foregroundColor(getColor(color))  
            }
        }
        .padding()
    }
    
    func getColor(_ name: String) -> Color {
        switch name.lowercased() {
        case "red": return .red
        case "green": return .green
        case "blue": return .blue
        default: return .black
        }
    }
}