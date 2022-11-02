//
//  WeeklyWeatherListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI

struct WeeklyWeatherListView: View {
    var body: some View {
        VStack {
            WeeklyWeatherCell
            WeeklyWeatherCell
            WeeklyWeatherCell
            WeeklyWeatherCell
            WeeklyWeatherCell
            WeeklyWeatherCell
            WeeklyWeatherCell
        }
        .padding(.top, 15)
    }
}

extension WeeklyWeatherListView {
    var WeeklyWeatherCell: some View {
        VStack {
            HStack {
                Text("요일요일")
                    .font(Font.weatherBody)
                Image(systemName: "leaf")
                Spacer()
                Text("최저 33도 최고 100도")
                    .font(Font.weatherBody)
            }
            .padding(.horizontal, 30)
            Image("weeklyLine")
        }
    }
}

struct WeeklyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherListView()
    }
}
