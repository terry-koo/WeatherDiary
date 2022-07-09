//
//  WeeklyWeatherManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/10.
//

import Foundation

class WeeklyWeatherManager {
    func requestWeeklyWeather(regId: String, date: String) async throws -> Void {
        guard let url = URL.forWeeklyWeather(regID: regId, date: date) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decoedData = try JSONDecoder().decode(ResponseForWeeklyWeather.self, from: data)
        print(decoedData)
   //     infos = self.fetchHourlyWeather(from: decoedData)
   //     self.currentTempCondition(decodedData: decoedData)
  //      try await self.lowestHighestTemp(grid: grid)
  //      // FIXME: - 스레드
    }
    
    func requestWeeklyTemperature(regId: String, date: String) async throws -> Void {
        guard let url = URL.forWeeklyTemperature(regID: regId, date: date) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decoedData = try JSONDecoder().decode(ResponseForWeeklyTemperature.self, from: data)
        print(decoedData)
   //     infos = self.fetchHourlyWeather(from: decoedData)
   //     self.currentTempCondition(decodedData: decoedData)
  //      try await self.lowestHighestTemp(grid: grid)
  //      // FIXME: - 스레드
    }
}
