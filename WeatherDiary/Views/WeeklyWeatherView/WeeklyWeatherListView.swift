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
            ForEach(WeeklyWeather(day: "", icon: "", highestTemperature: "", lowestTemperature: "").dummys, id: \.self) { row in
                WeeklyWeatherListRowView(weeklyWeather: WeeklyWeather(day: row.day, icon: row.icon, highestTemperature: row.highestTemperature, lowestTemperature: row.lowestTemperature))
            }
        }.listStyle(.plain)
    }
}

struct WeeklyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherListView()
    }
}
