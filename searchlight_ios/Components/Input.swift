//
//  Input.swift
//  searchlight_ios
//
//  Created by 김성빈 on 6/11/24.
//

import SwiftUI

extension View {
    func placeholder(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Typography
    ) -> some View {
        ZStack(alignment: alignment, content: {
            if shouldShow {placeholder()}
            self
        })
    }
}

struct Input: View {
    @Binding var text: String
    let label: String
    var action: (() -> Void)?
    var regex: String?
    
    @State private var isError: Bool?
    
    func validateInput(_ input: String) -> Bool {
        if input.isEmpty {return false}
        
        if let regex = regex {return input.range(of: regex, options: .regularExpression) != nil}
        
        return true
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Typography(text: label, color: (isError ?? false) ? Color.Colors.red : .Grayscale._30, fontType: .Caption)
                .padding(.horizontal, 8)
            
            TextField("", text: $text)
                .fontModifier(.Body, .Grayscale._10)
                .placeholder(when: text.isEmpty) {
                    Typography(text: "01가 1234", color: .Grayscale._40, fontType: .Body)
                }
                .onSubmit {
                    if !validateInput(text) {
                        isError = true
                        return
                    }
                    
                    isError = false
                    (action ?? {print("Input Submited: " + text)})()
                }
                .padding(16)
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.Grayscale._70)
                .overlay(
                    RoundedRectangle(cornerRadius: 12)
                    .inset(by: 0.5)
                    .stroke((isError ?? false) ? Color.Colors.red : Color.Grayscale._50, lineWidth: 1)
                )
                .cornerRadius(12)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 12.0)
    }
}

#Preview {
    struct PreviewWrapper: View {
        @State var carNumber = ""
        
        var body: some View {
            VStack {
                Input(text: $carNumber, label: "차량번호", regex: #""#)
            }
        }
    }
    
    return PreviewWrapper()
}
