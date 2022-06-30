//
//  DateManager.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/30.
//

import Foundation

class DateManager {
    
    func getToday() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Date())
    }
}
