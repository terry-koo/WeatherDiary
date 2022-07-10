//
//  CityCardListView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import SwiftUI

struct CityCardListView: View {
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack {
                    ForEach(0..<3, id: \.self) { city in
                        CityCardView()
                            .padding(.bottom)
                    }
                }
                .padding()
            }
        }
    } // body
}

struct CityCardListView_Previews: PreviewProvider {
    static var previews: some View {
        CityCardListView()
    }
}
