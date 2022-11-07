//
//  Date+Extension.swift
//  날씨장
//
//  Created by KiWoong Hong on 2022/11/07.
//

import SwiftUI

extension Date {
    /**
         # formatted
         - Parameters:
            - format: 변형할 DateFormat
         - Note: DateFormat으로 변형한 String 반환
        */
    public func formatted(_ format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(identifier: TimeZone.current.identifier)!
        formatter.locale = Locale(identifier: "ko_KR")
        
        return formatter.string(from: self)
    }
}
