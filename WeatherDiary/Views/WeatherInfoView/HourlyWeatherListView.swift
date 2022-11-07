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
            .padding(.leading, 20)
        }
    }
}

struct HourlyWeatherCellView: View {
    
    let hourlyWeather: HourWeather
    
    var body: some View {
        Image("card")
            .overlay {
                VStack {
                    Text("\(hourlyWeather.date.formatted("a h시"))")
                        .font(Font.weatherBody)
                        .padding(.top, 3)
                    Image(systemName: hourlyWeather.symbolName)
                        .resizable()
                        .scaledToFit()
                    Text("\(Int(hourlyWeather.temperature.value))°C")
                        .font(Font.weatherBody)
                        .padding(.bottom, 3)
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
