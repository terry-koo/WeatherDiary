//
//  HourlyWeatherCardListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/01.
//

import SwiftUI

struct HourlyWeatherCardListView: View {
    let hourlyWeathers: [HourlyWeather]
    var body: some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(hourlyWeathers, id: \.self) { hourlyWeather in
                    HourlyWeatherCardView(hourlyWeather: hourlyWeather)
                }
            }
        }
    }
}

let dummy: [HourlyWeather] = [
    HourlyWeather(time: "지금", icon: "sunny", temperature: "28도"),
    HourlyWeather(time: "오전 1시", icon: "sunny", temperature: "26도"),
    HourlyWeather(time: "오전 2시", icon: "sunny", temperature: "27도"),
    HourlyWeather(time: "오전 3시", icon: "sunny", temperature: "24도"),
    HourlyWeather(time: "오전 4시", icon: "sunny", temperature: "26도"),
    HourlyWeather(time: "오전 5시", icon: "sunny", temperature: "27도"),
    HourlyWeather(time: "오전 6시", icon: "sunny", temperature: "24도"),
    HourlyWeather(time: "오전 7시", icon: "sunny", temperature: "26도"),
    HourlyWeather(time: "오전 8시", icon: "sunny", temperature: "28도"),
    HourlyWeather(time: "오전 9시", icon: "sunny", temperature: "27도"),
    HourlyWeather(time: "오전 10시", icon: "sunny", temperature: "24도"),
    HourlyWeather(time: "오전 11시", icon: "sunny", temperature: "26도"),
    HourlyWeather(time: "오전 12시", icon: "sunny", temperature: "27도"),
    HourlyWeather(time: "오후 1시", icon: "sunny", temperature: "24도"),
    HourlyWeather(time: "오후 2시", icon: "sunny", temperature: "26도"),
    HourlyWeather(time: "오후 3시", icon: "sunny", temperature: "24도"),
    HourlyWeather(time: "오후 4시", icon: "sunny", temperature: "27도"),
    HourlyWeather(time: "오후 5시", icon: "sunny", temperature: "28도"),
    HourlyWeather(time: "오후 6시", icon: "sunny", temperature: "24도"),
    HourlyWeather(time: "오후 7시", icon: "sunny", temperature: "24도"),
    HourlyWeather(time: "오후 8시", icon: "sunny", temperature: "27도"),
    HourlyWeather(time: "오후 9시", icon: "sunny", temperature: "26도"),
    HourlyWeather(time: "오후 10시", icon: "sunny", temperature: "27도"),
    HourlyWeather(time: "오후 11시", icon: "sunny", temperature: "28도")
]

struct HourlyWeatherCardListView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherCardListView(hourlyWeathers: dummy)
    }
}
