//
//  WeeklyWeatherListRowVIew.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/09.
//

import SwiftUI

struct WeeklyWeatherListRowView: View {
    var body: some View {
        VStack {
            HStack {
                Text("요일")
                Image(systemName: "sun.max")
                Spacer()
                Text("최저 20°")
                Text("최고 99°")
            }
            .font(.custom("NanumBanJjagBanJjagByeor", size: 25))
            .padding(.horizontal)
        }
    }
}

struct WeeklyWeatherListRowView_Previews: PreviewProvider {
    static var previews: some View {
        WeeklyWeatherListRowView()
    }
}
