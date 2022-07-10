//
//  CityModel.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import Foundation

struct City: Identifiable, Hashable {
    var id = UUID()
    var fullAddress = ""
    var firstAddress: String = ""
    var secondAddress: String = ""
    var thirdAddress: String = ""
    var nx: String = ""
    var ny: String = ""
}
