//
//  WeatherInfoView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct WeatherInfoView: View {
    
    @EnvironmentObject var locationManager: LocationManager
    
    var weather: Weather
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            CurrentWeatherView(weather: weather, locality: locationManager.locality)
            HourlyWeatherListView(weather: weather)
            WeeklyWeatherListView(weather: weather)
        }
    }
}

