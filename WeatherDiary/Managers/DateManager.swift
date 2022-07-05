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
        formatter.dateFormat = "yyyy년 M월 d일 EEEE"
        return formatter.string(from: Date())
    }
    
    func getCurrentTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HHmm"
        return formatter.string(from: Date())
    }
    
    func getCategorizedTime() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "mm"
        let min = formatter.string(from: Date())
        formatter.dateFormat = "HH"
        var hour = Int(formatter.string(from: Date()))!
        
        if Int(min)! < 31 {
            print(String(hour))
            return String(hour) + "00"
        } else {
            hour += 1
            print(String(hour))
            return String(hour) + "00"
        }
    }
    
    
    
    func getCategorizedHour() -> String {
        let formatter = DateFormatter()
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
