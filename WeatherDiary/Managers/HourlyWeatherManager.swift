//
//  HourlyWeatherManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/02.
//

import Foundation

class HourlyWeatherManager: ObservableObject {
    @Published var infos: [HourlyWeather] = []
    let date = DateManager()
    var today: String { date.getTodayDate() }
    var currentTime: String { date.getCategorizedTime() }
    var baseTime: String { date.getCategorizedHour() + "00" }
    
    func requestHourlyWeather(grid: Grid) async throws -> Void {
        guard let url = URL.forHourlyWeather(date: today, baseTime: baseTime, grid: grid) else { fatalError("Missing URL") }
            
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decoedData = try JSONDecoder().decode(ResponseForHourlyWeather.self, from: data)
        
        infos = self.fetchHourlyWeather(from: decoedData)
    }
    
    private func fetchHourlyWeather(from decodedDate: ResponseForHourlyWeather) -> [HourlyWeather] {
        let hourlyItems = decodedDate.response.body.items.item
        var hourlyWeathers: [HourlyWeather] = []
        var condition: String = ""
        var temperature: String = ""
        var rainProbabillity: String = ""
        var sky: String = ""
        
        for item in hourlyItems {
            guard hourlyWeathers.count < 25 else { break }
            
            if (item.fcstDate == today && item.fcstTime >= currentTime) || item.fcstDate != today {
                switch item.category {
                case "POP": rainProbabillity = item.fcstValue
                case "TMP": temperature = item.fcstValue
                case "PTY": condition = item.fcstValue
                case "SKY": sky = item.fcstValue
                default: break
                }
                
                if condition != "" && temperature != "" && rainProbabillity != "" && sky != "" {
                    if item.fcstTime == currentTime {
                        hourlyWeathers.append(HourlyWeather(time: "지금", temperature: temperature + "°", rainProbabillity: rainProbabillity, condition: condition, sky: sky))
                    }
                    hourlyWeathers.append(HourlyWeather(time: item.fcstTime, temperature: temperature + "°", rainProbabillity: rainProbabillity, condition: condition, sky: sky))
                    condition = ""
                    temperature = ""
                    sky = ""
                    rainProbabillity = ""
                }
            }
        }
        return hourlyWeathers
    }
}

extension HourlyWeatherManager {
    var dummy: [HourlyWeather] {
        [
            HourlyWeather(time: "지금", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 1시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 2시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 3시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 4시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 5시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 6시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 7시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 8시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 9시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 10시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 11시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오전 12시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 1시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 2시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 3시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 4시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 5시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 6시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 7시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 8시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 9시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 10시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
            HourlyWeather(time: "오후 11시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2")
        ]
    }
}
