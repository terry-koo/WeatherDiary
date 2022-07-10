//
//  WeatherDiaryApp.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/29.
//

import SwiftUI

@main
struct WeatherDiaryApp: App {
    var body: some Scene {
        WindowGroup {
            //MainView()
            CityCardListView(searchText: "")
        }
    }
}
