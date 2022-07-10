//
//  WeeklyWeatherListRowVIew.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/09.
//

import SwiftUI

struct WeeklyWeatherListRowView: View {
    let weeklyWeather: WeeklyWeather
    var body: some View {
        VStack {
            HStack {
                Text(weeklyWeather.day)
                Image(systemName: weeklyWeather.icon)
                Spacer()
                Text("최저 \(weeklyWeather.temperature.lowest)°")
                Text("최고 \(weeklyWeather.temperature.highest)°")
            }
            .font(.custom("NanumBanJjagBanJjagByeor", size: 25))
            .padding(.horizontal)
        }
    }
}

/*struct WeeklyWeatherListRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherListRowView(weeklyWeather: WeeklyWeather(day: "월", icon: "sun.max", highestTemperature: "30", lowestTemperature: "22"))
    }
}
*/
