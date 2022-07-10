//
//  CSVManager.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import Foundation
import CSV


class CsvManager{
    func readCSVData() -> [City] {
        var result: [City] = []
        var temp: String = ""
        let path = Bundle.main.path(forResource: "address", ofType: "csv")
        let stream = InputStream(fileAtPath: path!)!
        let csv = try! CSVReader(stream: stream)
//        while let row = csv.next() {
//            print("\(row)")
//            print(type(of: row))
//        }
        var i = 0
        while let row = csv.next() {
            var city: City = City()
            if !row[2].isEmpty {
                temp += row[2]
                city.firstAddress = row[2]
            }
            if !row[3].isEmpty {
                temp += " " + row[3]
                city.secondAddress = row[3]
            }
            if !row[4].isEmpty {
                temp += " " + row[4]
                city.thirdAddress = row[4]
            }
            city.fullAddress = temp
            city.nx = row[5]
            city.ny = row[6]
            temp = ""
            result.append(city)
        }
        return result
    }
}

