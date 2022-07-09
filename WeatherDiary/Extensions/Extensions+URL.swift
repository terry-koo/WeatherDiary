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
        return URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=\(apiKey)&pageNo=1&numOfRows=380&dataType=JSON&base_date=\(date)&base_time=\(baseTime)&nx=\(grid.nx)&ny=\(grid.ny)")
    }
}
