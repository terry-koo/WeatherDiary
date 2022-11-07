//
//  HourlyWeatherListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct HourlyWeatherListView: View {
    
    var weather: Weather
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(weather.hourlyForecast.forecast[0..<24], id: \.date) { hourlyWeather in
                //    HourlyWeatherCell
                    HourlyWeatherCellView(hourlyWeather: hourlyWeather)
                }
            }
        }
    }
}

struct HourlyWeatherCellView: View {
    
    let hourlyWeather: HourWeather
    
    var body: some View {
        Image("card")
            .overlay {
                VStack {
                    Text("\(hourlyWeather.date)")
                        .font(Font.weatherBody)
                        .padding(.top, 5)
                    Image(systemName: hourlyWeather.symbolName)
                        .resizable()
                        .scaledToFit()
                    Text("\(Int(hourlyWeather.temperature.value))°C")
                        .font(Font.weatherBody)
                        .padding(.bottom, 5)
                }
            }
    }
}
/*
struct HourlyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherListView()
    }
}
*/
