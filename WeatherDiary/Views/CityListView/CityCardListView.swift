//
//  CityCardListView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import SwiftUI

struct CityCardListView: View {
    @State var searchText: String
    
    var body: some View {
        VStack {
            searchBar()
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
    
    
    @ViewBuilder
    func searchBar() -> some View{
        ZStack {
            Rectangle()
                .foregroundColor(Color("LightGray"))
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Search ..", text: $searchText)
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
    }
    
}

struct CityCardListView_Previews: PreviewProvider {
    static var previews: some View {
        CityCardListView(searchText: "포항")
    }
}
