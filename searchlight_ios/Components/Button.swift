//
//  Buttons.swift
//  searchlight_ios
//
//  Created by 김성빈 on 6/10/24.
//

import SwiftUI

struct ButtonLarge: View {
    let label: String
    var action: (() -> Void)?
    var icon: ImageResource?
    
    var body: some View {
        Button(action: (action ?? {
            print("Button Clicked")
        }), label: {
            HStack (spacing: 8, content: {
                Typography(text: label, color: Color.Grayscale._70, fontType: .HeadLine)
                
                if icon != nil {
                    Image(icon!)
                }
            })
            .padding(.vertical, 16.0)
            .frame(maxWidth: .infinity)
            .background(Color.Colors.green).cornerRadius(12)
            .contentShape(Rectangle())
        })
    }
}

#Preview {
    ButtonLarge(label: "다음", icon: .Icons.arrowForward)
}
