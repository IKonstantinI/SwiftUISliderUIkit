//
//  ContentViewViewModel.swift
//  SwiftUISliderUIkit
//
//  Created by horze on 18.03.2024.
//

import Foundation
import Observation

@Observable final class ContentViewViewModel {
    var currentValue = Double.random(in: 0...100)
    var targetValue = Int.random(in: 0...100)
    var alertIsPresented = false
    
    var scores: Int {
        100 - abs(targetValue - lround(currentValue))
    }
    
    var alpha: Double {
        Double(scores) / 100
    }
    
    func showAlert() {
        alertIsPresented.toggle()
    }
    
    func reset() {
        currentValue = Double.random(in: 0...100)
        targetValue = Int.random(in: 0...100)
    }
}
