//
//  CurrentWeatherView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI

struct CurrentWeatherView: View {
    var body: some View {
        VStack {
            Text("2022년 10월 28일 목요일")
                .font(Font.weatherTitle)
            HStack {
                Text("(지역) (날씨)")
                    .font(Font.weatherLargeTitle)
                Image("sun")
                    .resizable()
                    .scaledToFit()
                    .frame(height : 60)
            }
            .padding(.vertical, 50)
            HStack {
                Text("16도")
                    .font(Font.weatherLargeTitle)
                VStack {
                    Text("최고")
                    Text("19도")
                }
                .font(Font.weatherTitle)
                VStack {
                    Text("최저")
                    Text("11도")
                }
                .font(Font.weatherTitle)
            }
        }
        .padding(.top, 40)
        .frame(maxWidth: .infinity)
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}
