//
//  CalculatorView.swift
//  Calculator
//
//  Created by 유정인 on 2022/05/26.
//

import SwiftUI
import Foundation

struct CalculatorView: View {
    var buttonColor = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
    @State var arithmeticOperation = ArithmeticOperation()
    @State var value = "0"
    
    var body: some View {
        
        VStack {
            HStack {
                Spacer()
                
                Text(value)
                    .lineLimit(1)
                    .minimumScaleFactor(0.5)
                    .foregroundColor(Color.white)
                    .font(.system(size: 90))
                    
//                    .fontWeight(.light)
                
            }
            .padding(.horizontal, 20)
            
            HStack {
                OperatorButtonView(buttonColor: Color(.lightGray), iconImage: "AC", buttonTextColor: Color.black, arithmeticOperation: $arithmeticOperation, value: $value)
                OperatorButtonView(buttonColor: Color(.lightGray), iconImage: "+/-", buttonTextColor: Color.black, arithmeticOperation: $arithmeticOperation, value: $value)
                OperatorButtonView(buttonColor: Color(.lightGray), iconImage: "%", buttonTextColor: Color.black, arithmeticOperation: $arithmeticOperation, value: $value)
                OperatorButtonView(buttonColor: Color.orange, iconImage: "/", arithmeticOperation: $arithmeticOperation, value: $value)
            }
            HStack {
                ForEach(7..<10) { i in
                    CalButtonView(iconImage: String(i), arithmeticOperation: $arithmeticOperation, value: $value)
                }
                OperatorButtonView(buttonColor: Color.orange, iconImage: "x", arithmeticOperation: $arithmeticOperation, value: $value)
            }
            HStack {
                ForEach(4..<7) { i in
                    CalButtonView(iconImage: String(i), arithmeticOperation: $arithmeticOperation, value: $value)
                }
                OperatorButtonView(buttonColor: Color.orange, iconImage: "-", arithmeticOperation: $arithmeticOperation, value: $value)
            }
            HStack {
                ForEach(1..<4) { i in
                    CalButtonView(iconImage: String(i), arithmeticOperation: $arithmeticOperation, value: $value)
                }
                OperatorButtonView(buttonColor: Color.orange, iconImage: "+", arithmeticOperation: $arithmeticOperation, value: $value)
            }
            HStack {
                // 0 버튼
                Button(action: {
                    
                }) {
                    RoundedRectangle(cornerRadius: UIScreen.main.bounds.height)
                        .foregroundColor(buttonColor)
                        .frame(width: (UIScreen.main.bounds.width - 60) / 1.9, height: (UIScreen.main.bounds.width - 60) / 4)
                        .overlay(
                            Text("0")
                                .foregroundColor(Color.white)
                                .fontWeight(.regular)
                                .font(.system(size: 35))
                        )
                }
                OperatorButtonView(iconImage: ".", arithmeticOperation: $arithmeticOperation, value: $value)
                OperatorButtonView(buttonColor: Color.orange, iconImage: "=", arithmeticOperation: $arithmeticOperation, value: $value)
            }
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
