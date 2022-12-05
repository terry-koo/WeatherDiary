//
//  LicenseView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/09/17.
//

import SwiftUI

struct LicenseView: View {
    
    @State private var isLoadWebView = false
    
    var body: some View {
        HStack(alignment: .center) {
            Text(" Weather")
                .foregroundColor(Color.gray)
                .font(Font.caption2)
            Button(action: {
                self.isLoadWebView = true
            }, label: {
                Text("data sorce")
                    .font(Font.caption2)
            }).sheet(isPresented: $isLoadWebView) {
                LoadWebView()
            }
        }
    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView()
    }
}
