//
//  LoadingView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack {
            Spacer()
            Image("sun")
                .resizable()
                .frame(width: 100, height: 100)
            Text("엄마한테 날씨 물어보는 중...")
                .font(Font.weatherTitle)
        
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
