//
//  WeatherInfoView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI

struct WeatherInfoView: View {
    var body: some View {
        ScrollView {
            CurrentWeatherView()
            HourlyWeatherListView()
            WeeklyWeatherListView()
        }
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView()
    }
}
