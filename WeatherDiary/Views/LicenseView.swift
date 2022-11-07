//
//  LicenseView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/09/17.
//

import SwiftUI

struct LicenseView: View {
    var body: some View {
        VStack {
            Text("")
            Text("")
            Image("sunnyCloudy")
                .resizable()
                .frame(width: 250, height: 200)
            Spacer()
        }
        .background(
            Image("background")
                .resizable()
                .scaledToFill()
                .edgesIgnoringSafeArea(.all)
        )
    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView()
    }
}
