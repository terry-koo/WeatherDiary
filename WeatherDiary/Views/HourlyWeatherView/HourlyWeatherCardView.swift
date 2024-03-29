//
//  HourlyWeatherCardView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/06/30.
//

import SwiftUI

struct HourlyWeatherCardView: View {
    
    let hourlyWeather: HourlyWeather
    
    var body: some View {
        Image("card")
            .overlay {
                VStack {
                    Text("  \(hourlyWeather.displayTime)")
                    //    .font(.custom("NanumBanJjagBanJjagByeor", size: 20))
                        .padding(.top, 10)
                    Image(systemName: hourlyWeather.icon)
                        .resizable()
                        .scaledToFit()
                    Text(hourlyWeather.temperature)
                  //      .font(.custom("NanumBanJjagBanJjagByeor", size: 20))
                        .padding(.bottom, 10)
                }
            }
        .frame(width: 100, height: 120)
    }
}

struct HourlyWeatherCardView_Previews: PreviewProvider {
    static var previews: some View {
        HourlyWeatherCardView(hourlyWeather: HourlyWeather(time: "오후 11시", temperature: "28도", rainProbabillity: "0", condition: "0", sky: "3"))
    }
}
