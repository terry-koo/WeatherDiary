//
//  Extensions+URL.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/02.
//

import Foundation


extension URL {
    // MARK: - API key
    private static var apiKey: String {
      get {
        guard let filePath = Bundle.main.path(forResource: "key", ofType: "plist") else {
          fatalError("Couldn't find file 'Info.plist'.")
        }
        let plist = NSDictionary(contentsOfFile: filePath)
        guard let value = plist?.object(forKey: "apiKey") as? String else {
          fatalError("Couldn't find key 'API_KEY' in 'Info.plist'.")
        }
        return value
      }
    }
    
    static func forHourlyWeather(date: String, baseTime: String, grid: Grid) -> URL? {
        return URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=\(apiKey)&pageNo=1&numOfRows=1000&dataType=JSON&base_date=\(date)&base_time=\(baseTime)&nx=\(grid.nx)&ny=\(grid.ny)")
    }
    
    static func forWeeklyWeather(regID: String, date: String) -> URL? {
        return URL(string: "https://apis.data.go.kr/1360000/MidFcstInfoService/getMidLandFcst?serviceKey=\(apiKey)&pageNo=1&numOfRows=10&dataType=JSON&regId=\(regID)&tmFc=\(date)") // regId=11B00000&tmFc=202207090600
    }
    
    static func forWeeklyTemperature(regID: String, date: String) -> URL? {
        return URL(string: "https://apis.data.go.kr/1360000/MidFcstInfoService/getMidTa?serviceKey=\(apiKey)&pageNo=1&numOfRows=10&dataType=JSON&regId=\(regID)&tmFc=\(date)")
    }
    
    static func forLowestHighestTemperature(grid: Grid, date: String) -> URL? {
        return URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=\(apiKey)&pageNo=1&numOfRows=1000&dataType=JSON&base_date=\(date)&base_time=0200&nx=\(grid.nx)&ny=\(grid.ny)")
    }
}
