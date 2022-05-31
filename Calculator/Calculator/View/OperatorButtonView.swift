//
//  OperatorButtonView.swift
//  Calculator
//
//  Created by 유정인 on 2022/05/31.
//

import SwiftUI

struct OperatorButtonView: View {
    var buttonColor = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
    var iconImage: String // 기호 다루는데 사용
    var buttonTextColor = Color.white
    var buttonSize = (UIScreen.main.bounds.width - 60) / 4
    
    // 인스턴스 생성
    @Binding var arithmeticOperation: ArithmeticOperation
    @Binding var value: String
    var body: some View {
        Button(action: {

            if iconImage == "+" {
                value = ""
                arithmeticOperation.operation = .plus
                
            } else if iconImage == "-" {
                
                arithmeticOperation.operation = .minus

            } else if iconImage == "*" {
                
                arithmeticOperation.operation = .multiply

            } else if iconImage == "/" {
                
                arithmeticOperation.operation = .divide

            } else if iconImage == "=" {
                value = arithmeticOperation.operate().description
            }
            
        }) {
            Circle()
                .frame(width: buttonSize, height: buttonSize)
                .foregroundColor(buttonColor)
                .overlay(Text(iconImage)
                    .fontWeight(.regular)
                    .foregroundColor(buttonTextColor)
                    .font(.system(size: 35))
                )
        }
    }
}
