//
//  Extensions+URL.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/02.
//

import Foundation

let API_KEY = "zfUHmCouE2vnx14zqmzMMoIb%2Fe2PYANk0aPgx7MStVXdIeeGcwoPOsxfDn38UsHCtkKCBqqW%2FgELFNmAedcTmQ%3D%3D"

extension URL {
    static func forHourlyWeather(_ date: String, _ base_time: String, _ nx: Int, _ ny: Int) -> URL? {
        return URL(string: "https://apis.data.go.kr/1360000/VilageFcstInfoService_2.0/getVilageFcst?serviceKey=\(API_KEY)&pageNo=1&numOfRows=240&dataType=JSON&base_date=\(date)&base_time=\(base_time)&nx=55&ny=127")
    }
}
