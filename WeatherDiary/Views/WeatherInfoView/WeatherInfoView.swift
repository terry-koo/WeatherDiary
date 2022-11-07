//
//  WeatherInfoView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI
import WeatherKit

struct WeatherInfoView: View {
    
    let weatherService = WeatherService.shared
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?
    
    var body: some View {
        ScrollView {
            CurrentWeatherView()
            HourlyWeatherListView()
            WeeklyWeatherListView()
            
            // currentWeather: CurrentWeather = weather.currentWeather
            // hourWeathers: [HourWeather] = weather.hourlyForecast.forecast
            // dayWeathers: [DayWeather] = weather.dailyForecast.forecast
            
            // when changed locationManager.currentLocation
            // redo task
        }
        .task(id: locationManager.currentLocation) {
            do {
                
                if let location = locationManager.currentLocation {
                    self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
            }
        }
    }
}

struct WeatherInfoView_Previews: PreviewProvider {
    static var previews: some View {
        WeatherInfoView()
    }
}
