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
        Text(date.getTodayDateTime())
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
