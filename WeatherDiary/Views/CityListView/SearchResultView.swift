//
//  SearchResultView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import SwiftUI

struct SearchResultView: View {
    @Binding var searchText: String
    var data = CsvManager().readCSVData()
    
    var body: some View {
        // TODO: - 검색 속도 개선 필요
        List(data.lazy.filter({ $0.fullAddress.contains(searchText) })) { item in
            Text(item.fullAddress)
        }
        .listStyle(PlainListStyle())
        
    }
}


