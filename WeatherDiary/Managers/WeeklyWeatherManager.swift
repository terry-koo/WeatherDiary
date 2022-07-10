//
//  WeeklyWeatherManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/10.
//

import Foundation

class WeeklyWeatherManager {
    
    var weeklyWeather: [WeeklyWeather] = []
    private var temporaryForecasts: [Forecast] = []
    private var temporaryTemperatures: [Temperature] = []
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
        
        let item = decoedData.response.body.items.item[0]
        temporaryForecasts.append(Forecast(rainProbability: item.rnSt3Am, sky: item.wf3Am))
        temporaryForecasts.append(Forecast(rainProbability: item.rnSt4Am, sky: item.wf4Am))
        temporaryForecasts.append(Forecast(rainProbability: item.rnSt5Am, sky: item.wf5Am))
        temporaryForecasts.append(Forecast(rainProbability: item.rnSt6Am, sky: item.wf6Am))
        temporaryForecasts.append(Forecast(rainProbability: item.rnSt7Am, sky: item.wf7Am))
    }
    
    func requestWeeklyTemperature(regId: String) async throws -> Void {
        guard let url = URL.forWeeklyTemperature(regID: regId, date: baseDate) else { fatalError("Missing URL") }

        let urlRequest = URLRequest(url: url)

        let (data, response) = try await URLSession.shared.data(for: urlRequest)

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }

        let decoedData = try JSONDecoder().decode(ResponseForWeeklyTemperature.self, from: data)
        
        let item = decoedData.response.body.items.item[0]
        temporaryTemperatures.append(Temperature(highest: item.taMax3, lowest: item.taMin3))
        temporaryTemperatures.append(Temperature(highest: item.taMax4, lowest: item.taMin4))
        temporaryTemperatures.append(Temperature(highest: item.taMax5, lowest: item.taMin5))
        temporaryTemperatures.append(Temperature(highest: item.taMax6, lowest: item.taMin6))
        temporaryTemperatures.append(Temperature(highest: item.taMax7, lowest: item.taMin7))
    }
    
    func fetchWeeklyWeather(weatherRegId: String, temperatureRegId: String) async throws -> Void {
        
        do {
            try await requestWeeklyWeather(regId: weatherRegId)
            try await requestWeeklyTemperature(regId: temperatureRegId)
        } catch {
            print("errorroror")
        }
        
        for index in temporaryForecasts.indices {
            weeklyWeather.append(WeeklyWeather(day: "", icon: "", forecast: temporaryForecasts[index], temperature: temporaryTemperatures[index]))
        }
    }
}
