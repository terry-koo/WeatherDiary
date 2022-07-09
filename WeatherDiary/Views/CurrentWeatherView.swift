//
//  CurrentWeatherView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/03.
//

import SwiftUI

struct CurrentWeatherView: View {
    var currentWeather: CurrentWeather
    var dateManager: DateManager = DateManager()
    var body: some View {
        VStack {
            Text("\(dateManager.getTodayDateTime())")
                .font(.custom("NanumBanJjagBanJjagByeor", size: 30))
            HStack {
                Spacer(minLength: 75)
                boldText(value: "포항")
                Spacer()
                boldText(value: "\(currentWeather.condition!)")
                Spacer(minLength: 75)
            } // HStack
            HStack(alignment: .center) {
                Spacer()
                boldTemp(temp: "\(currentWeather.currentTemp!)")
                    .offset(x: 0, y: -10)
                getCategorizedTemp(category: "최고", temp: "\(currentWeather.highestTemp!)")
                .padding(.horizontal)
                getCategorizedTemp(category: "최저", temp: "\(currentWeather.lowestTemp!)")
                Spacer()
            } // HStack
        } // VStack
    } // body
} // CurrentWeatherView

@ViewBuilder
func boldText(value: String) -> some View {
    ZStack {
        Text(value)
        Text(value)
            .offset(x: 1, y: 1)
        Text(value)
            .offset(x: 2, y: 2)
    }
    .minimumScaleFactor(0.3)
    .lineLimit(1)
    .font(.custom("NanumBanJjagBanJjagByeor", size: 80))
}

@ViewBuilder
func boldTemp(temp: String) -> some View {
    ZStack {
        HStack {
            Text(temp)
                .font(.custom("NanumBanJjagBanJjagByeor", size: 120))
            Text("°")
                .font(.system(size: 30))
        }
        HStack {
            Text(temp)
                .font(.custom("NanumBanJjagBanJjagByeor", size: 120))
            Text("°")
                .font(.system(size: 30))
        }
        .offset(x: 1, y: 1)
        HStack {
            Text(temp)
                .font(.custom("NanumBanJjagBanJjagByeor", size: 120))
            Text("°")
                .font(.system(size: 30))
        }
        .offset(x: 2, y: 2)
    }
}

@ViewBuilder
func getCategorizedTemp(category: String, temp: String) -> some View {
    VStack {
        Text(category)
            .font(.custom("NanumBanJjagBanJjagByeor", size: 30))
        HStack {
            Text(temp)
                .font(.custom("NanumBanJjagBanJjagByeor", size: 50))
            Text("°")
                .font(.system(size: 20))
        }
    }
}

//struct CurrentWeatherView_Previews: PreviewProvider {
//    static var previews: some View {
//        CurrentWeatherView()
//    }
//}
