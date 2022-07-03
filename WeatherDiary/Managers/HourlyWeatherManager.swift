//
//  HourlyWeatherManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/02.
//

import Foundation

class HourlyWeatherManager {
    func getResponseHourlyWeather(date: String, baseTime: String, nx: Int, ny: Int) async throws -> ResponseForHourlyWeather {
        guard let url = URL.forHourlyWeather(date, baseTime, nx, ny) else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decoedData = try JSONDecoder().decode(ResponseForHourlyWeather.self, from: data)
        
        return decoedData
    }
    
    func getHourlyWeather(from weatherAPI: ResponseForHourlyWeather) {
        let hourlyItems = weatherAPI.response.body.items.item
        var hourlyWeathers: [HourlyWeather] = []
        var condition: String = ""
        var temperature: String = ""
        var rainProbabillity: String = ""
        
        for item in hourlyItems {
            switch item.category {
            case "POP": rainProbabillity = item.fcstValue
            case "TMP": temperature = item.fcstValue
            case "PTY": condition = item.fcstValue
            default: break
            }
            
            if condition != "" && temperature != "" && rainProbabillity != "" {
                hourlyWeathers.append(HourlyWeather(time: item.fcstTime, icon: "", temperature: temperature, rainProbabillity: rainProbabillity, condition: condition))
                condition = ""
                temperature = ""
                rainProbabillity = ""
            }
        }
        
    }
}
