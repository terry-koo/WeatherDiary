//
//  ContentView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/06/29.
//

import SwiftUI

struct ContentView: View {
    var date: DateManager = DateManager()
    var body: some View {
        Spacer()
        Image("sun")
            .resizable()
            .frame(width: 80, height: 80)
        Text("엄마한테 포항 날씨 물어보는 중...")
            .font(.custom("NanumBanJjagBanJjagByeor", size: 25))
            
        Spacer()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
