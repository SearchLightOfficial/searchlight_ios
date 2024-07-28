//
//  PatientViewModel.swift
//  searchlight_ios
//
//  Created by 김성빈 on 7/29/24.
//

import SwiftUI

class PatientViewModel: ObservableObject {
    private var locationManager = LocationManager()
    
    @Published var location: String = ""
    
    @Published var step: Int8 = 0
    
    @Published var age: String = ""
    @Published var isAgeError: Bool = false
    
    func getLocation() {
        locationManager.checkLocationAuthorization()
        
        location = String(format: "%f", locationManager.lastKnownLocation?.latitude ?? 0)
    }
    
    private let ageRegex: String = "^[0-9]+$"
    
    func prevStep() {
        if step != 0 {
            step -= 1
        }
    }
    
    func nextStep() {
        switch step {
        case 0:
            isAgeError = (!validateByRegex(age, ageRegex)) || age.isEmpty
            if isAgeError {return}
            
            step += 1
        case 1:
            print("step 2")
        default:
            print("Setp Overflow")
        }
    }
}
