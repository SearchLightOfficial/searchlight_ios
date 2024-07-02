//
//  EntryView.swift
//  searchlight_ios
//
//  Created by 김성빈 on 6/10/24.
//

import SwiftUI

struct OnboardingView: View {
    @ObservedObject var viewModel = OnboardingViewModel()
    
    var body: some View {
        Color.Grayscale._60.ignoresSafeArea()
        VStack(spacing: 40, content: {
            Image(.logoText)
                .resizable()
                .scaledToFit()
                .frame(height: 36)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Input(text: $viewModel.carNumber, label: "차량번호", action: viewModel.registerCarNumber, regex: #"^([0-9]{2}[가-힣]{1}[0-9]{4})|([0-9]{3}[가-힣]{1}[0-9]{4})$"#)
                
                Typography(text: "차량번호는 설정에서 변경할 수 있습니다.", color: .Grayscale._20, fontType: .Caption)
                    .padding(8)
            })
            
            ButtonLarge(label: "등록", icon: .Icons.arrowForward)
        })
        .padding(.horizontal, 20.0)
   }
}

#Preview {
    OnboardingView()
}
