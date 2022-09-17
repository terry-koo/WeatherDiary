//
//  WeatherDiaryApp.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/29.
//

import SwiftUI

@main
struct WeatherDiaryApp: App {
    @StateObject var locationManager: LocationManager = LocationManager()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(locationManager)
            //CityCardListView(searchText: "")
        }
    }
}
