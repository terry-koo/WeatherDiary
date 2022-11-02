//
//  HourlyWeatherListView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI

struct HourlyWeatherListView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                HourlyWeatherCell
                HourlyWeatherCell
                HourlyWeatherCell
                HourlyWeatherCell
                HourlyWeatherCell
                HourlyWeatherCell
                HourlyWeatherCell
            }
        }
    }
}

extension HourlyWeatherListView {
    var HourlyWeatherCell: some View {
        Image("card")
            .overlay {
                VStack {
                    Text("현재 시간")
                        .font(Font.weatherBody)
                        .padding(.top, 5)
                    Image(systemName: "leaf")
                        .resizable()
                        .scaledToFit()
                    Text("기온")
                        .font(Font.weatherBody)
                        .padding(.bottom, 5)
                }
            }
        
    }
}

struct HourlyWeatherListView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherListView()
    }
}
