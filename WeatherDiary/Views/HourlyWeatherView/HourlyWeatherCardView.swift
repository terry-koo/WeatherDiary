//
//  HourlyWeatherCardView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/06/30.
//

import SwiftUI

struct HourlyWeatherCardView: View {
    
    let hourlyWeather: HourlyWeather
    
    var body: some View {
        VStack {
            Text(hourlyWeather.displayTime)
                .padding(.top, 10)
            Image(systemName: hourlyWeather.icon)
                .resizable()
                .scaledToFit()
            Text(hourlyWeather.temperature)
                .padding(.bottom, 10)
        }
        .frame(width: 100, height: 120)
        .overlay {
            Image("card")
                .resizable()
        }
    }
}

struct HourlyWeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherCardView(hourlyWeather: HourlyWeather(time: "오후 11시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "3"))
    }
}
