import SwiftUI

struct PickPill: View {
    @State private var picked: String = "red"

    var body: some View {
        VStack {
            Text("Picked: \(picked)")  

            HStack {
                RadioButton(text: "Blue pill", value: "blue", selectedValue: $picked)
                RadioButton(text: "Red pill", value: "red", selectedValue: $picked)
            }
            .padding()
        }
    }
}

struct RadioButton: View {
    let text: String
    let value: String
    @Binding var selectedValue: String

    var body: some View {
        HStack {
            Image(systemName: selectedValue == value ? "largecircle.fill.circle" : "circle")
                .onTapGesture {
                    selectedValue = value
                }
            Text(text)
                .onTapGesture {
                    selectedValue = value
                }
        }
    }
}