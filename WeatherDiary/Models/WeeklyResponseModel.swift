//
//  WeeklyResponseModel.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/10.
//

import Foundation

struct ResponseForWeeklyWeather: Codable {
    let response: Response

    struct Response: Codable {
        let header: Header
        let body: Body
    }

    struct Header: Codable {
        let resultCode: String
        let resultMsg: String
    }
    
    struct Body: Codable {
        let dataType: String
        let items: Items
        let pageNo, numOfRows, totalCount: Int
    }

    struct Items: Codable {
        let item: [Item]
    }

    struct Item: Codable {
        let regId: String
        let wf3Am, wf4Pm, wf5Pm, wf6Pm, wf7Pm: String
        let rnSt3Am, rnSt4Pm, rnSt5Pm, rnSt6Pm, rnSt7Pm: Int
    }
}

struct ResponseForWeeklyTemperature: Codable {
    let response: Response

    struct Response: Codable {
        let header: Header
        let body: Body
    }

    struct Header: Codable {
        let resultCode: String
        let resultMsg: String
    }
    
    struct Body: Codable {
        let dataType: String
        let items: Items
        let pageNo, numOfRows, totalCount: Int
    }

    struct Items: Codable {
        let item: [Item]
    }

    struct Item: Codable {
        let regId: String
        let taMin3, taMin4, taMin5, taMin6, taMin7, taMin8: Int
        let taMax3, taMax4, taMax5, taMax6, taMax7, taMax8: Int
    }
}
