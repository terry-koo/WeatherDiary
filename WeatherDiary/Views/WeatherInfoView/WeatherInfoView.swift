//
//  WeatherInfoView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI

struct WeatherInfoView: View {
    var body: some View {
        CurrentWeatherView()
        HourlyWeatherListView()
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView()
    }
}
