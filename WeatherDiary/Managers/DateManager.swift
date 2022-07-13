//
//  DateManager.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/30.
//

import Foundation

class DateManager {
    let formatter = DateFormatter()
    
    func getTodayDate() -> String {
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Date())
    }
    
    func getYesterday() -> String {
        formatter.dateFormat = "yyyyMMdd"
        return formatter.string(from: Date() - 86400) // 1day = 86400sec
    }
    // 이 함수를 getTodayDateTime으로 바꾸고
    func getToday() -> String {
        formatter.dateFormat = "yyyyMMddHHmm"
        return formatter.string(from: Date())
    }
    // 이 함수명은 getTodayDateDay로 바꿔야 할 듯
    func getTodayDateTime() -> String {
        formatter.dateFormat = "yyyy년 M월 d일 EEEE"
        return formatter.string(from: Date())
    }
    
    func getCurrentTime() -> String {
        formatter.dateFormat = "HHmm"
        return formatter.string(from: Date())
    }
    
    func getCategorizedTime() -> String {
        formatter.dateFormat = "mm"
        let min = formatter.string(from: Date())
        formatter.dateFormat = "HH"
        var hour = Int(formatter.string(from: Date()))!
        
        if Int(min)! < 31 {
            return String(hour) + "00"
        } else {
            hour += 1
            return String(hour) + "00"
        }
    }
    
    func getWeeklyDay(offset: Int) -> String {
        formatter.dateFormat = "EEEEE"
        let day = formatter.string(from: Date().addingTimeInterval(TimeInterval(3600 * 24 * offset)))
        return day
    }
    
    // FIXME: - case "01", "02" 수정 필요
    func getCategorizedHour() -> String {
        formatter.dateFormat = "HH"
        
        switch formatter.string(from: Date()) {
        case "03","04","05":
            return "02"
        case "06","07","08":
            return "05"
        case "09","10","11":
            return "08"
        case "12","13","14":
            return "11"
        case "15","16","17":
            return "14"
        case "18","19","20":
            return "17"
        case "21","22","23":
            return "20"
        case "24","00","01","02":
            return "23"
        default:
            return "02"
        }
    }
}
