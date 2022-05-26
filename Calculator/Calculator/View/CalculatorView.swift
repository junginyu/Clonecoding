//
//  CalculatorView.swift
//  Calculator
//
//  Created by 유정인 on 2022/05/26.
//

import SwiftUI

struct CalculatorView: View {
    var buttonColor = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
    
    var body: some View {
        VStack {
            HStack {
                calButton(buttonColor: Color(.lightGray), iconImage: "AC", buttonTextColor: Color.black)
                calButton(buttonColor: Color(.lightGray), iconImage: "+/-", buttonTextColor: Color.black)
                calButton(buttonColor: Color(.lightGray), iconImage: "%", buttonTextColor: Color.black)
                calButton(buttonColor: Color.orange, iconImage: "/")
            }
            HStack {
                calButton(iconImage: "7")
                calButton(iconImage: "8")
                calButton(iconImage: "9")
                calButton(buttonColor: Color.orange, iconImage: "x")
            }
            HStack {
                calButton(iconImage: "4")
                calButton(iconImage: "5")
                calButton(iconImage: "6")
                calButton(buttonColor: Color.orange, iconImage: "-")
            }
            HStack {
                calButton(iconImage: "1")
                calButton(iconImage: "2")
                calButton(iconImage: "3")
                calButton(buttonColor: Color.orange, iconImage: "+")
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
                                .font(.system(size: UIScreen.main.bounds.width - 385))
                        )
                }
                calButton(iconImage: ".")
                calButton(buttonColor: Color.orange, iconImage: "=")
            }
        }
    }
}

struct calButton: View {
    var buttonColor = Color(UIColor(red: 55/255.0, green: 55/255.0, blue: 55/255.0, alpha: 1))
    var iconImage: String
    var buttonTextColor = Color.white
    var buttonSize = (UIScreen.main.bounds.width - 60) / 4
    
    var body: some View {
        Button(action: {
            
        }) {
            Circle()
                .frame(width: buttonSize, height: buttonSize)
                .foregroundColor(buttonColor)
                .overlay(Text(iconImage)
                    .fontWeight(.regular)
                    .foregroundColor(buttonTextColor)
                    .font(.system(size: UIScreen.main.bounds.width - 385))
                )
        }
    }
}

struct CalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        CalculatorView()
    }
}
