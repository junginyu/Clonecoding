//
//  ContentView.swift
//  Calculator
//
//  Created by 유정인 on 2022/05/21.
//

import SwiftUI

struct ContentView: View {
    var numberShow: Int = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                CalculatorView()
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
