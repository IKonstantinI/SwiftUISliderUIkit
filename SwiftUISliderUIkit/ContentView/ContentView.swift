//
//  ContentView.swift
//  SwiftUISliderUIkit
//
//  Created by horze on 17.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var contentViewVM: ContentViewViewModel
    
    var body: some View {
        VStack {
            Text("Подвиньте слайдер, как можно ближе к: \(contentViewVM.targetValue)")
            
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: $contentViewVM.currentValue,
                    alpha: contentViewVM.alpha,
                    color: .red
                )
                Text("100")
            }
            
            Button("Проверь меня!", action: contentViewVM.showAlert)
                .padding()
                .alert(
                    "Ваш счет",
                    isPresented: $contentViewVM.alertIsPresented,
                    actions: {}
                ) {
                    Text(contentViewVM.scores.formatted())
                }
            
            Button("Начать заново") {
                contentViewVM.reset()
            }
        }
        .padding()
    }
}

struct Register_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(contentViewVM: ContentViewViewModel())
    }
}
