//
//  ContentView.swift
//  Weather
//
//  Created by Thomas Cubillos arcos on 26-11-23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false;
    
    var body: some View {
        ZStack {
            BackgroundView(topColor: isNight ? .black : .blue,
                           bottomColor: isNight ? .gray : Color("lightBlue"))
            VStack{
                CityTextView(cityName: "San miguel, SA")
                
                MainWeatherStatusView(imageName: "sun.max.fill", temperature: 32)
                
                HStack(spacing: 22){
                    WeatherDayView(dayOfWeek: "Juev",
                                   imageName: "cloud.sun.fill",
                                   temperature: 28)
                    WeatherDayView(dayOfWeek: "Vier",
                                   imageName: "sun.max.fill",
                                   temperature: 32)
                    WeatherDayView(dayOfWeek: "Saba",
                                   imageName: "wind",
                                   temperature: 25)
                    WeatherDayView(dayOfWeek: "Doming",
                                   imageName: "cloud.fog.fill",
                                   temperature: 20)
                }
                    Spacer()
                
                Button{
                    isNight.toggle();
                }label: {
                    WeatherButton(title: isNight ? "Light Mode" : "Night Mode", textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    
    var dayOfWeek: String;
    var imageName: String;
    var temperature: Int;
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    var topColor:Color;
    var bottomColor: Color;

    var body: some View {
        LinearGradient(colors: [topColor, bottomColor],
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName:String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32,weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View{
    
    var imageName: String;
    var temperature: Int;
    
    var body: some View{
        VStack(spacing: 8){
                Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temperature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

