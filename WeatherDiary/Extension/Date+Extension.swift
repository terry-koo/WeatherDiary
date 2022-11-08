//
//  Date+Extension.swift
//  날씨장
//
//  Created by KiWoong Hong on 2022/11/07.
//

import SwiftUI

extension Date {
    // MARK: - 요일만 표시
    
    public var onlyDay: String {
        return toString("EEE요일")
    }
      
      // MARK: - 요일 포함 날짜 표시
    public var basicWithDay: String {
        return toString("yyyy년 M월 d일 EEE요일")
    }
      
      // MARK: - 시간 표시
    public var timeOnlyHour: String {
        return toString("a h시")
    }
      
      // MARK: - Date -> String
    public func toString(_ dateFormat: String) -> String {
        return DateFormatter
            .convertToKoKR(dateFormat: dateFormat)
            .string(from: self)
    }
}

extension DateFormatter {
    public static func convertToKoKR(dateFormat: String) -> DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR")
      //  dateFormatter.timeZone = TimeZone(abbreviation: "KST")
        dateFormatter.dateFormat = dateFormat
        return dateFormatter
    }
}
