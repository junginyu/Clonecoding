//
//  CalculatorView.swift
//  Calculator
//
//  Created by 유정인 on 2022/05/26.
//

import SwiftUI
import Foundation

enum CalcButton: String {
    case add
    case subtract
    case divide
    case multiply
    case equal
    case clear
    case decimal
    case percent
    case negative
}

struct CalculatorView: View {
    var buttonColor = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
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
                CalButton(buttonColor: Color(.lightGray), iconImage: value == "0" ? "AC" : "C", buttonTextColor: Color.black, value: $value)
                CalButton(buttonColor: Color(.lightGray), iconImage: "+/-", buttonTextColor: Color.black, value: $value)
                CalButton(buttonColor: Color(.lightGray), iconImage: "%", buttonTextColor: Color.black, value: $value)
                CalButton(buttonColor: Color.orange, iconImage: "/", value: $value)
            }
            HStack {
                ForEach(7..<10) { i in
                    CalButton(iconImage: String(i), value: $value)
                }
                CalButton(buttonColor: Color.orange, iconImage: "x", value: $value)
            }
            HStack {
                ForEach(4..<7) { i in
                    CalButton(iconImage: String(i), value: $value)
                }
                CalButton(buttonColor: Color.orange, iconImage: "-", value: $value)
            }
            HStack {
                ForEach(1..<4) { i in
                    CalButton(iconImage: String(i), value: $value)
                }
                CalButton(buttonColor: Color.orange, iconImage: "+", value: $value)
            }
            HStack {
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
                CalButton(iconImage: ".", value: $value)
                CalButton(buttonColor: Color.orange, iconImage: "=", value: $value)
            }
        }
    }
    
//    func didTap(button: iconImage) {
//
//    }
    
}

struct CalButton: View {
    var buttonColor = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
    var iconImage: String
    var buttonTextColor = Color.white
    var buttonSize = (UIScreen.main.bounds.width - 60) / 4
    @Binding var value: String
    
    var body: some View {
        Button(action: {
            if value == "0" {
                value = iconImage
            } else {
                value += iconImage
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

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
