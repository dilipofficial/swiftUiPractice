//
//  WheatherButton.swift
//  swiftUiPractice
//
//  Created by dilipkumar on 16/08/24.
//

import SwiftUI

struct WheatherButton: View{
    
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View{
        Text(title)
            .font(.system(size: 20, weight: .bold, design: .default))
            .frame(width: 280, height: 50)
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}
