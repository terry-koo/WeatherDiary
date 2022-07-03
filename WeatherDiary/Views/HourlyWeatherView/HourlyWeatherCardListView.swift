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
    HourlyWeather(time: "지금", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 1시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 2시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 3시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 4시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 5시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 6시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 7시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 8시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 9시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 10시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 11시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오전 12시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 1시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 2시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 3시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 4시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 5시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 6시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 7시", temperature: "24도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 8시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 9시", temperature: "26도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 10시", temperature: "27도", rainProbabillity: "0", condition: "0", sky: "2"),
    HourlyWeather(time: "오후 11시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "2")
]

struct HourlyWeatherCardListView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherCardListView(hourlyWeathers: dummy)
    }
}
