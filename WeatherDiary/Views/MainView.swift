//
//  MainView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/05.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        VStack {
            CurrentWeatherView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
