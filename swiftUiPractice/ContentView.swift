//
//  ContentView.swift
//  swiftUiPractice
//
//  Created by Dilip Kumar on 10/08/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    
    var body: some View {
        ZStack{
            BackgroundView(isNight: isNight)
            
            VStack{
                
                CityTextView(cityName: "Cupertino, CA")
                
                MainWheatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                       temperature: isNight ? 23 : 76)
                
                HStack(spacing: 10){
                    
                    WheatherDayView(dayOfWeek: "TUE",
                                    imageName: "cloud.sun.fill",
                                    temperature: 74)
                    
                    WheatherDayView(dayOfWeek: "WED",
                                    imageName: "sun.max.fill",
                                    temperature: 88)
                    
                    WheatherDayView(dayOfWeek: "THU",
                                    imageName: "sunset.fill",
                                    temperature: 60)
                    
                    WheatherDayView(dayOfWeek: "FRI",
                                    imageName: "wind.snow",
                                    temperature: 55)
                    
                    WheatherDayView(dayOfWeek: "SAT",
                                    imageName: "snow",
                                    temperature: 25)
                    
                }
                Spacer()
                
                Button{
                    
                    isNight.toggle()
                } label: {
                    WheatherButton(title: "Change Day Time",
                                   textColor: .blue,
                                   backgroundColor: .white)
                }
                
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WheatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .resizable()
                .symbolRenderingMode(.multicolor)
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
   var isNight: Bool
    
    var body: some View {
//        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
//                                                   isNight ? .gray : Color("lightBlue")]),
//                       startPoint: .topLeading,
//                       endPoint: .bottomTrailing)
//            .ignoresSafeArea()
        
        ContainerRelativeShape()
        .fill(isNight ? Color.black.gradient : Color.blue.gradient)
        .ignoresSafeArea()
    }
}


struct CityTextView: View{
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .foregroundColor(.white)
            .font(.system(size: 32, weight: .medium))
            .padding()
    }
}


struct MainWheatherStatusView: View{
    
    var imageName: String
    var temperature: Int
    
    var body: some View{
        
        VStack(spacing: 10){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperature)")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}


