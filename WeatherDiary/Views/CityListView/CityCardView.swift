//
//  CityCardView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import SwiftUI

struct CityCardView: View {
    var body: some View {
        HStack {
            Spacer()
            boldText("포항")
            Spacer()
            VStack {
                Image(systemName: "cloud.rain")
                    .resizable()
                    .scaledToFit()
                    .offset(x: -5, y: 20)
                Text("50%")
                    .font(.custom("NanumBanJjagBanJjagByeor", size: 40))
            }
            Spacer()
            VStack {
                cardBoldTemperature(temp: "30")
                    .offset(x: 0, y: 10)
                
                HStack {
                    temperature("32")
                    temperature("27")
                }
                .offset(x: 0, y: -40)
            }
            Spacer()
        }
        .frame(width: UIScreen.main.bounds.size.width*0.85, height: UIScreen.main.bounds.size.height*0.11)
        .padding()
        .overlay {
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color.black, lineWidth: 3)
        }
    } // body
    
    
    @ViewBuilder
    func cardBoldText(_ value: String) -> some View {
        ZStack {
            Text(value)
            Text(value)
                .offset(x: 1, y: 1)
            Text(value)
                .offset(x: 2, y: 2)
        }
        .minimumScaleFactor(0.3)
        .lineLimit(1)
        .font(.custom("NanumBanJjagBanJjagByeor", size: 90))
    }
    
    @ViewBuilder
    func cardBoldTemperature(temp: String) -> some View {
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
        .fixedSize(horizontal: true, vertical: true)
    }
    
    @ViewBuilder
    func temperature(_ temp: String) -> some View {
            HStack {
                Text(temp)
                    .font(.custom("NanumBanJjagBanJjagByeor", size: 40))
                Text("°")
                    .font(.system(size: 15))
            }
    }
    
} // CityCardView

struct CityCardView_Previews: PreviewProvider {
    static var previews: some View {
        CityCardView()
    }
}
