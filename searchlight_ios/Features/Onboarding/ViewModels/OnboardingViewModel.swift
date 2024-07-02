//
//  OnboardingViewModel.swift
//  searchlight_ios
//
//  Created by 김성빈 on 6/10/24.
//
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @Published var carNumber: String = UserDefaults.standard.string(forKey: "carNumber") ?? ""
    
    func registerCarNumber() {
        // TODO
    }
}
