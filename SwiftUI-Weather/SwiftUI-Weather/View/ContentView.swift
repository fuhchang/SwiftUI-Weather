//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Fuh chang Loi on 21/5/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            WeatherMainBodyView().navigationBarTitle("", displayMode: .inline).navigationBarHidden(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherMainBodyView: View {
    @State private var isNight = false
    var body: some View {
            ZStack {
                BackgroundView(isNight: $isNight)
                VStack(spacing: 8) {
                    CityTextView(cityName: "Cupertino, CA")
                    MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperture: isNight ? 40 : 76)
                    HStack(spacing: 20) {
                        
                        WeatherDayView(model: WeatherModel(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temperautre: 75))
                        WeatherDayView(model: WeatherModel(dayOfWeek: "WED", imageName: "sun.max.fill", temperautre: 88))
                        WeatherDayView(model: WeatherModel(dayOfWeek: "THU", imageName: "wind.snow", temperautre: 55))
                        WeatherDayView(model: WeatherModel(dayOfWeek: "FRI", imageName: "sunset.fill", temperautre: 60))
                        WeatherDayView(model: WeatherModel(dayOfWeek: "SAT", imageName: "snow", temperautre: 25))
                    }
                    Spacer()
                    Button {
                        isNight.toggle()
                    } label: {
                        WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                    }
                    NavigationLink(
                        destination: SecondContentView(color: .blue, num: 2),
                        label: {
                            Text("Next Screen")
                                .bold()
                                .frame(width: 280, height: 50)
                                .background(Color.green)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        })
                    Spacer()
                }
                
            }
    }
}
struct WeatherDayView: View {
    var model: WeatherModel
    var body: some View {
        VStack {
            Text(model.dayOfWeek).font(.system(size: 16, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: model.imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(model.temperautre)°").font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    @Binding var isNight: Bool
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temperture: Int
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(temperture)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}
