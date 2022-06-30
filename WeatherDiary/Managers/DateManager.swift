//
//  DateManager.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/30.
//

import Foundation

class DateManager {
    
    func getTodayDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Date())
    }
    
    func getTodayDateTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "M월 d일 EEEE a h시 m분"
        return formatter.string(from: Date())
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh"
        return formatter.string(from: Date())
    }
}
