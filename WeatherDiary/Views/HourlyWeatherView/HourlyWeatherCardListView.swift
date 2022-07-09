//
//  HourlyWeatherCardListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/01.
//

import SwiftUI

struct HourlyWeatherCardListView: View {
    let hourlyWeathers: [HourlyWeather]
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(hourlyWeathers, id: \.self) { hourlyWeather in
                    HourlyWeatherCardView(hourlyWeather: hourlyWeather)
                }
            }
        }
    }
}

