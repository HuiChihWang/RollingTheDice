//
//  ResponsiveTextFieldView.swift
//  RollingTheDice
//
//  Created by Hui Chih Wang on 2021/5/13.
//

import SwiftUI

struct ResponsiveTextFieldView: View {
    let placeHolder: String
    @Binding var input: String
    
    var body: some View {
        TextField(placeHolder, text: $input)
            .modifier(ResponsiveTextFieldModifier(isInputValid: !input.isEmpty))
            .modifier(ClearButton(text: $input))
    }
}

struct ClearButton: ViewModifier {
    @Binding var text: String
    func body(content: Content) -> some View {
        ZStack {
            content
            if !text.isEmpty {
                HStack() {
                    Spacer()
                    Button(action: {
                        text = ""
                    }) {
                        Image(systemName: "xmark.circle")
                            .font(.system(size: 20))
                            .foregroundColor(.gray)
                    }
                    .padding(.trailing, 10)
                }
            }
        }
    }
}

struct ResponsiveTextFieldModifier: ViewModifier {
    var isInputValid = false
    
    func body(content: Content) -> some View {
        content
            .padding(EdgeInsets(top: 10, leading: 15, bottom: 10, trailing:15))
            .overlay(
                RoundedRectangle(cornerRadius: 25.0)
                    .stroke(lineWidth: 3)
                    .foregroundColor(isInputValid ? .blue : .gray)
            )
    }
}

struct ResponsiveTextFieldView_Previews: PreviewProvider {
    @State static var input = ""
    
    static var previews: some View {
        ResponsiveTextFieldView(placeHolder: "Hello", input: $input)
            .previewLayout(.sizeThatFits)
    }
}
