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
            Text("본 저작물은 기상청에서 22년 작성하여 공공누리 제1유형으로 개방한 단기예보 조회서비스와 중기예보 조회서비스를 이용하였으며, 해당 저작물은 공공데이터 포털(https://www.data.go.kr/index.do)에서 무료로 다운받으실 수 있습니다.")
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
