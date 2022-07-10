//
//  WeeklyWeatherManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/10.
//

import Foundation

class WeeklyWeatherManager {
    private var baseDate: String {
        let dateManager: DateManager = DateManager()
        let yesterdayBaseDate: String = dateManager.getYesterday() + "1800"
        let firstBaseDate: String = dateManager.getTodayDate() + "0600"
        let secondBaseDate: String = dateManager.getTodayDate() + "1800"
        let currentDate: String = dateManager.getToday()
        
        if currentDate < firstBaseDate {
            return yesterdayBaseDate
        } else if currentDate > secondBaseDate {
            return secondBaseDate
        } else {
            return firstBaseDate
        }
    }
    
    func requestWeeklyWeather(regId: String) async throws -> Void {
        guard let url = URL.forWeeklyWeather(regID: regId, date: baseDate) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decoedData = try JSONDecoder().decode(ResponseForWeeklyWeather.self, from: data)
        print(decoedData)
    }
    
    func requestWeeklyTemperature(regId: String) async throws -> Void {
        guard let url = URL.forWeeklyTemperature(regID: regId, date: baseDate) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decoedData = try JSONDecoder().decode(ResponseForWeeklyTemperature.self, from: data)
        print(decoedData)
    }
}
