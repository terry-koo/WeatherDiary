//
//  WeatherManager.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/30.
//
import Foundation

class WeatherManager {

    var terryAPIKey: String = "fv9v%2FC0lJTsG5sn8PiTI5JWpEMmmu1gYle8lG2Ebk0nqECQCRZvpqsGQ4L1U3wxT5SpqTX1bWsBfmSoBvQk6sw%3D%3D"

    func getCurrentWeather(nx: String = "102", ny: String = "94") async throws -> Void {
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
        
        // MARK: - TMP
        for i in decodedData.response.body.items.item.filter{ $0.category == "TMP" && $0.fcstDate == dateManager.getTodayDate() && Int($0.fcstTime)! >= Int(dateManager.getCategorizedTime())!} {
            print("\(i.fcstTime) : \(i.fcstValue)")
        }
    }

    func getTmxTmn(nx: String = "102", ny: String = "94") async throws -> Void {
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

        // MARK: - TMX
        for i in decodedData.response.body.items.item.filter{ $0.category == "TMX" && $0.fcstDate == dateManager.getTodayDate() } {
            print("TMX \(i.fcstTime) : \(i.fcstValue)")
        }

        // MARK: - TMN
        for i in decodedData.response.body.items.item.filter{ $0.category == "TMN" && $0.fcstDate == dateManager.getTodayDate() } {
            print("TMN \(i.fcstTime) : \(i.fcstValue)")
        }
    }

}
