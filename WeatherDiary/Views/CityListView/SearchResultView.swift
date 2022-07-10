//
//  SearchResultView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/07/10.
//

import SwiftUI

struct SearchResultView: View {
    @Binding var searchText: String
    
    var citys = [ City(firstName: "포항"),
                      City(firstName: "대구"),
                      City(firstName: "서울"),
                      City(firstName: "부산"),
                    ]
    
    var body: some View {
        List(citys.filter({ searchText.isEmpty ? false : $0.firstName.contains(searchText) })) { item in
            Text(item.firstName)
        }
    }
}

//strCity(firstName: "Meet Eddie for lunch"),uct SearchResultView_Previews: PreviewProvider {
//    static var previews: some View {
//        SearchResultView()
//    }
//}
