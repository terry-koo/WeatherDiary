//
//  LoadingView.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/10/29.
//

import SwiftUI

struct LoadingView: View {
    
    @State private var angle = 0.0
    
    var body: some View {
        VStack {
            Spacer()
            
            Image("sun")
                .resizable()
                .frame(width: 100, height: 100)
                .rotationEffect(.degrees(angle))
                .animation(.timingCurve(0, 0.8, 0.2, 1, duration: 10), value: angle)
                .onTapGesture { angle += Double.random(in: 3600 ..< 3960) }
            
            Text("엄마한테 날씨 물어보는 중...")
                .font(Font.weatherTitle)
                .foregroundColor(Color.black)
        
            Spacer()
        }
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
