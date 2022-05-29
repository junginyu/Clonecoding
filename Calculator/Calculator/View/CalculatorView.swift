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
                calButton(buttonColor: Color(.lightGray), iconImage: value == "0" ? "AC" : "C", buttonTextColor: Color.black, value: $value)
                calButton(buttonColor: Color(.lightGray), iconImage: "+/-", buttonTextColor: Color.black, value: $value)
                calButton(buttonColor: Color(.lightGray), iconImage: "%", buttonTextColor: Color.black, value: $value)
                calButton(buttonColor: Color.orange, iconImage: "/", value: $value)
            }
            HStack {
                calButton(iconImage: "7", value: $value)
                calButton(iconImage: "8", value: $value)
                calButton(iconImage: "9", value: $value)
                calButton(buttonColor: Color.orange, iconImage: "x", value: $value)
            }
            HStack {
                calButton(iconImage: "4", value: $value)
                calButton(iconImage: "5", value: $value)
                calButton(iconImage: "6", value: $value)
                calButton(buttonColor: Color.orange, iconImage: "-", value: $value)
            }
            HStack {
                calButton(iconImage: "1", value: $value)
                calButton(iconImage: "2", value: $value)
                calButton(iconImage: "3", value: $value)
                calButton(buttonColor: Color.orange, iconImage: "+", value: $value)
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
                calButton(iconImage: ".", value: $value)
                calButton(buttonColor: Color.orange, iconImage: "=", value: $value)
            }
        }
    }
    
//    func didTap(button: iconImage) {
//
//    }
    
}

struct calButton: View {
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
