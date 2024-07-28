//
//  PatientView.swift
//  searchlight_ios
//
//  Created by 김성빈 on 7/10/24.
//

import SwiftUI

struct PatientView: View {
    @ObservedObject var viewModel = PatientViewModel()
    
    var body: some View {
        VStack(alignment: .trailing, spacing: 0) {
            Header(prevClick: {
                viewModel.prevStep()
            })
            
            Banner(text: "안녕하세요\n환자 정보를 입력해주세요.") {
                HStack(spacing: 24) {
                    HStack(spacing: 4) {
                        Image(.Icons.locationOn)
                        
                        Text(viewModel.location)
                            .fontModifier(.Body, .Grayscale._30)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    Button(action: {
                        viewModel.getLocation()
                    }) {
                        Typography(text: "새로고침", color: .Colors.greenDarker, fontType: .Body)
                            .underline()
                    }
                }
                
                ScrollView {
                    Input(text: $viewModel.age, isError: $viewModel.isAgeError, label: "환자 추정 나이", placholder: "나이를 입력해주세요")
                }
                
                ButtonLarge(label: "다음", action: {
                    viewModel.nextStep()
                }, icon: .Icons.arrowForward)
            }
        }.onAppear {
            viewModel.getLocation()
        }
    }
}

#Preview {
    PatientView()
}
