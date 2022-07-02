//
//  HourlyWeatherManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/02.
//

import Foundation

class HourlyWeatherManager {
    func getHourlyWeather(date: String, baseTime: String, nx: Int, ny: Int) async throws -> ResponseForHourlyWeather {
        guard let url = URL.forHourlyWeather(date, baseTime, nx, ny) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decoedData = try JSONDecoder().decode(ResponseForHourlyWeather.self, from: data)
        
        return decoedData
    }
}
