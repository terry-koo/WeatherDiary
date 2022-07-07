//
//  WeatherManager.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/30.
//
import Foundation

class WeatherManager {
    var currentWeather: CurrentWeather = CurrentWeather()

    var terryAPIKey: String = "fv9v%2FC0lJTsG5sn8PiTI5JWpEMmmu1gYle8lG2Ebk0nqECQCRZvpqsGQ4L1U3wxT5SpqTX1bWsBfmSoBvQk6sw%3D%3D"

    func currentTempCondition(nx: String = "102", ny: String = "94") async throws -> CurrentWeather {
        let dateManager: DateManager = DateManager()
        
        guard let url = URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=\(terryAPIKey)&pageNo=1&numOfRows=290&dataType=JSON&base_date=\(dateManager.getTodayDate())&base_time=\(dateManager.getCategorizedHour())00&nx=\(nx)&ny=\(ny)") else {
            fatalError("Missing URL")
        }
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        let decodedData = try JSONDecoder().decode(Response.self, from: data)
        
        // MARK: - Condition: 현재 기상 상태
        for i in decodedData.response.body.items.item.filter({ ($0.fcstDate == dateManager.getTodayDate() && $0.fcstTime == dateManager.getCategorizedTime() && $0.category == "POP") || ($0.fcstDate == dateManager.getTodayDate() && $0.fcstTime == dateManager.getCategorizedTime() && $0.category == "PTY") || ($0.fcstDate == dateManager.getTodayDate() && $0.fcstTime == dateManager.getCategorizedTime() && $0.category == "SKY") }){
            switch i.category {
            case "SKY":
                currentWeather.sky = i.fcstValue
            case "PTY":
                currentWeather.pty = i.fcstValue
            case "POP":
                currentWeather.pop = i.fcstValue
            default:
                break
            }
        }
        
        // MARK: - TMP: 현재 기온
        for i in decodedData.response.body.items.item.filter({ $0.category == "TMP" && $0.fcstDate == dateManager.getTodayDate() && Int($0.fcstTime)! >= Int(dateManager.getCategorizedTime())!}) {
            print("\(i.fcstTime) : \(i.fcstValue)")
            currentWeather.currentTemp = i.fcstValue
            break
        }
        return currentWeather
    }

    func lowestHighestTemp(nx: String = "102", ny: String = "94") async throws -> Void {
        let dateManager: DateManager = DateManager()
        
        guard let url = URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=\(terryAPIKey)&pageNo=1&numOfRows=290&dataType=JSON&base_date=\(dateManager.getTodayDate())&base_time=0200&nx=\(nx)&ny=\(ny)") else {
            fatalError("Missing URL")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(Response.self, from: data)

        // MARK: - TMX: 일 최고 기온
        for i in decodedData.response.body.items.item.filter({ $0.category == "TMX" && $0.fcstDate == dateManager.getTodayDate() }) {
            currentWeather.highestTemp = i.fcstValue
            break
        }

        // MARK: - TMN: 일 최저 기온
        for i in decodedData.response.body.items.item.filter({ $0.category == "TMN" && $0.fcstDate == dateManager.getTodayDate() }) {
            currentWeather.lowestTemp = i.fcstValue
            break
        }
    }
}
