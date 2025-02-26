import SwiftUI

struct ColorOption: Identifiable {
    let id: Int
    let text: String
}

struct ColorSelect: View {
    @State private var selectedColorId: Int = 2
    
    let colors: [ColorOption] = [
        ColorOption(id: 1, text: "red"),
        ColorOption(id: 2, text: "blue"),
        ColorOption(id: 3, text: "green"),
    ]

    var body: some View {
        VStack {
            Text("Selected Color ID: \(selectedColorId)")
            
            Picker("Select Color", selection: $selectedColorId) {
                ForEach(colors) { color in
                    Text(color.text).tag(color.id)
                }
            }
            .pickerStyle(MenuPickerStyle())  
        }
        .padding()
    }
}