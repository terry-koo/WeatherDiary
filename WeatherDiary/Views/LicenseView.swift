//
//  LicenseView.swift
//  WeatherDiary
//
//  Created by Terry Koo on 2022/09/17.
//

import SwiftUI

struct LicenseView: View {
    var body: some View {
        HStack(alignment: .center) {
            Text(" Weather")
                .foregroundColor(Color.gray)
                .font(Font.caption2)
            NavigationLink(destination: LoadWebView(), label: {
                Text("data sorce")
                    .font(Font.caption2)
            })
        }
    }
}

struct LicenseView_Previews: PreviewProvider {
    static var previews: some View {
        LicenseView()
    }
}
