//
//  Header.swift
//  searchlight_ios
//
//  Created by 김성빈 on 7/10/24.
//

import SwiftUI

struct Header: View {
    var prevClick: (() -> Void)?

    var body: some View {
        HStack {
            Button(action: (prevClick ?? {
                print("Button Clicked")
            }), label: {
                Image(.Icons.arrowBackward)
            })
            .padding(10)
                     
            Spacer()
            
            Button(action: {}, label: {
                Image(.Icons.settings)
            })
            .padding(10)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 12)
    }
}

#Preview {
    Header()
}
