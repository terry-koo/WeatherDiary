//
//  WeeklyWeatherListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/09.
//

import SwiftUI

struct WeeklyWeatherListView: View {
    var body: some View {
        List {
            ForEach(WeeklyWeather(day: "", forecast: Forecast(rainProbability: 0, sky: ""), temperature: Temperature(highest: 0, lowest: 0)).dummys, id: \.self) { row in
                WeeklyWeatherListRowView(weeklyWeather: WeeklyWeather(day: row.day, forecast: row.forecast, temperature: row.temperature))
            }
        }.listStyle(.plain)
    }
}

struct WeeklyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherListView()
    }
}
