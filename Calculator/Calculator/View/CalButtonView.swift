//
//  CalButtonView.swift
//  Calculator
//
//  Created by 유정인 on 2022/05/31.
//

import SwiftUI

struct CalButtonView: View {
    var buttonColor = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
    var iconImage: String // 기호 다루는데 사용
    var buttonTextColor = Color.white
    var buttonSize = (UIScreen.main.bounds.width - 60) / 4
    
    // 인스턴스 생성
    @Binding var arithmeticOperation: ArithmeticOperation
    
    @Binding var value: String //숫자 다루는데 사용
    
    var body: some View {
        Button(action: {
            print(value.description)
            
            if value == "0" {
                value = iconImage
            } else {
                value += iconImage
            }
            
            if arithmeticOperation.operation == nil {
                arithmeticOperation.leftPort = Double(value)!
            } else {
                arithmeticOperation.rightPort = Double(value)!
            }
            
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 9
            value = (numberFormatter.string(for: Double(value.components(separatedBy: ",").joined()))!)
            
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

class ArithmeticOperation {
    var leftPort: Double? = nil
    var rightPort: Double? = nil
    var operation: Operation? = nil
    
    func operate() -> Double {
        switch operation {
        case .plus:
            return leftPort! + rightPort!
            
        case .minus:
            return leftPort! - rightPort!
            
        case .multiply:
            return leftPort! * rightPort!

        case .divide:
            return leftPort! / rightPort!

        default:
            return 0

        }
    }
}

enum Operation {
    case plus
    case minus
    case multiply
    case divide
}
//struct CalButtonView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalButtonView()
//    }
//}
