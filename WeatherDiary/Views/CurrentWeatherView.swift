//
//  CurrentWeatherView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/03.
//

import SwiftUI

struct CurrentWeatherView: View {
    var dateManager: DateManager = DateManager()
    var body: some View {
        VStack {
            Text("\(dateManager.getTodayDateTime())")
                .font(.custom("NanumBanJjagBanJjagByeor", size: 30))
            HStack {
                Spacer(minLength: 75)
                ZStack {
                    Text("포항")
                    Text("포항")
                        .offset(x: 1, y: 1)
                    Text("포항")
                        .offset(x: 2, y: 2)
                }
                Spacer()
                ZStack {
                    Text("맑음")
                    Text("맑음")
                        .offset(x: 1, y: 1)
                    Text("맑음")
                        .offset(x: 2, y: 2)
                }
                Spacer(minLength: 75)
            }
            .font(.custom("NanumBanJjagBanJjagByeor", size: 80))
        
            HStack(alignment: .center) { // 적용 안된듯
                Spacer()
                ZStack {
                    HStack {
                        Text("25")
                            .font(.custom("NanumBanJjagBanJjagByeor", size: 120))
                        Text("°")
                            .font(.system(size: 30))
                    }
                    
                    HStack {
                        Text("25")
                            .font(.custom("NanumBanJjagBanJjagByeor", size: 120))
                        Text("°")
                            .font(.system(size: 30))
                    }
                    .offset(x: 1, y: 1)
                    
                    HStack {
                        Text("25")
                            .font(.custom("NanumBanJjagBanJjagByeor", size: 120))
                        Text("°")
                            .font(.system(size: 30))
                    }
                    .offset(x: 2, y: 2)
                    
                }
                
                VStack {
                    Text("최고")
                        .font(.custom("NanumBanJjagBanJjagByeor", size: 30))
                    HStack {
                        Text("27")
                            .font(.custom("NanumBanJjagBanJjagByeor", size: 50))
                        Text("°")
                            .font(.system(size: 20))
                    }
                }
                .padding(.horizontal)
                VStack {
                    Text("최저")
                        .font(.custom("NanumBanJjagBanJjagByeor", size: 30))
                    HStack {
                        Text("20")
                            .font(.custom("NanumBanJjagBanJjagByeor", size: 50))
                        Text("°")
                            .font(.system(size: 20))
                    }
                }
                Spacer()
            }
        }
    }
}

struct CurrentWeatherView_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
    }
}
