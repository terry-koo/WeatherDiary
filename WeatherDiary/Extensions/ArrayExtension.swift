//
//  ArrayExtenstion.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import Foundation

extension Array {
    func prefixFilter(check: (Element) -> Bool, count: Int) -> [Element] {
        var result = [Element]()
        for x in self {
            if check(x) {
                result.append(x)
                if result.count == count {
                    break
                }
            }
        }
        return result
    }
}
