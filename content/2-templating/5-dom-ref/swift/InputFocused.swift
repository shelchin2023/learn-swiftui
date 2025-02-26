import SwiftUI
import UIKit

struct FocusableTextField: UIViewRepresentable {
    @Binding var text: String
    var onAppear: (UITextField) -> Void  

    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.text = text

        DispatchQueue.main.async {
            onAppear(textField)   
        }

        return textField
    }

    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
}

struct InputFocused: View {
    @State private var text = ""
    @State private var textFieldRef: UITextField?  

    var body: some View {
        VStack {
            FocusableTextField(text: $text) { tf in
                textFieldRef = tf
            }
            .frame(height: 40)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    textFieldRef?.becomeFirstResponder() 
                }
            }
        }
        .padding()
    }
}