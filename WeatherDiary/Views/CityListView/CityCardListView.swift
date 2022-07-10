//
//  CityCardListView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import SwiftUI

struct CityCardListView: View {
    @State var searchText: String
    @State private var isEditing = false
    
    var body: some View {
        VStack {
            HStack {
                searchBar()
                if isEditing {
                    Button(action: {
                        self.isEditing = false
                        self.searchText = ""
                    }) {
                        Text("취소")
                    }
                    .padding(.trailing, 10)
                    .offset(x: -5, y: 0)
                }
            }
            if !isEditing {
                ScrollView(.vertical) {
                    VStack {
                        ForEach(0..<3, id: \.self) { city in
                            CityCardView()
                                .padding(.bottom)
                        }
                    }
                    .padding()
                }
            } else {
                SearchResultView(searchText: $searchText)
                Spacer()
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
                TextField("도시 검색", text: $searchText)
                    .foregroundColor(.black)
            }
            .foregroundColor(.gray)
            .padding(.leading, 13)
        }
            .frame(height: 40)
            .cornerRadius(13)
            .padding()
            .onTapGesture {
                self.isEditing = true
            }
    }
    
}

struct CityCardListView_Previews: PreviewProvider {
    static var previews: some View {
        CityCardListView(searchText: "포항")
    }
}
