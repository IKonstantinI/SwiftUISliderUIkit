//
//  UISliderRepresentation.swift
//  SwiftUISliderUIkit
//
//  Created by horze on 18.03.2024.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
   
    @Binding var value: Double
    
    let alpha: Double
    let color: UIColor

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.valueChangad),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ view: UISlider, context: Context) {
        view.value = Float(value)
        view.thumbTintColor = color.withAlphaComponent(alpha)
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(currentValue: $value)
    }
}

extension UISliderRepresentation {
    final class Coordinator: NSObject {
        
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func valueChangad(_ sender: UISlider) {
            currentValue = Double(sender.value)
        }
    }
}


#Preview {
    UISliderRepresentation(value: .constant(50.0), alpha: 0.1, color: .red)
}
