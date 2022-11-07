//
//  MainView.swift
//  날씨장
//
//  Created by KiWoong Hong on 2022/11/07.
//

import SwiftUI
import WeatherKit

struct MainView: View {
    
    let weatherService = WeatherService.shared
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?
    
    var body: some View {
        VStack {
            if let weather {
                WeatherInfoView(weather: weather)
            } else {
                LoadingView()
            }
        }
        .task(id: locationManager.currentLocation) {
            do {
                if let location = locationManager.currentLocation {
                    self.weather = try await weatherService.weather(for: location)
                }
            } catch {
                print(error)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
