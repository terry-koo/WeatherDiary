//
//  LocationManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/07/03.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()
    
    @Published var location: CLLocationCoordinate2D?
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
        checkLocationAuthorization()
    }
    
    func checkLocationAuthorization() {
        switch manager.authorizationStatus {
        case .notDetermined:
            manager.requestWhenInUseAuthorization()
        case .restricted:
            print("Your Location is restricted.")
        case .denied:
            print("You have denied this app location permission.")
        case .authorizedAlways, .authorizedWhenInUse:
            break
        @unknown default:
            break
        }
    }
    
    func requestLocation() {
        isLoading = true
        manager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last?.coordinate
        isLoading = false
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Eror getting location", error)
        isLoading = false
    }
    
    func locationToGrid(lat: Double, lon: Double) -> Grid {
        print(lat)
        let EARTH_RADIUS = 6371.00877 // 지구 반경(km)
        let GRID = 5.0 // 격자 간격(km)
        let SLAT1 = 30.0 // 투영 위도1(degree)
        let SLAT2 = 60.0 // 투영 위도2(degree)
        let OLON = 126.0 // 기준점 경도(degree)
        let OLAT = 38.0 // 기준점 위도(degree)
        let XO:Double = 43 // 기준점 X좌표(GRID)
        let YO:Double = 136 // 기1준점 Y좌표(GRID)
        
        let DEGRAD = Double.pi / 180.0
        
        let earthRadius = EARTH_RADIUS / GRID
        let slat1 = SLAT1 * DEGRAD
        let slat2 = SLAT2 * DEGRAD
        let olon = OLON * DEGRAD
        let olat = OLAT * DEGRAD
        
        var sn = tan(Double.pi * 0.25 + slat2 * 0.5) / tan(Double.pi * 0.25 + slat1 * 0.5)
        sn = log(cos(slat1) / cos(slat2)) / log(sn)
        var sf = tan(Double.pi * 0.25 + slat1 * 0.5)
        sf = pow(sf, sn) * cos(slat1) / sn
        var ro = tan(Double.pi * 0.25 + olat * 0.5)
        ro = earthRadius * sf / pow(ro, sn)
        
        var grid = Grid(nx: 0, ny: 0)
        
        var ra = tan(Double.pi * 0.25 + (lat) * DEGRAD * 0.5)
        ra = earthRadius * sf / pow(ra, sn)
        var theta = lon * DEGRAD - olon
        if theta > Double.pi { theta -= 2.0 * Double.pi }
        if theta < -Double.pi { theta += 2.0 * Double.pi }
        
        theta *= sn
        print(floor(ra * sin(theta) + XO + 0.5))
        grid.nx = Int(floor(ra * sin(theta) + XO + 0.5))
        grid.ny = Int(floor(ro - ra * cos(theta) + YO + 0.5))
        return grid
    }
}

struct Grid {
    var nx: Int
    var ny: Int
}

// func locationToGrid 함수 출처 https://gist.github.com/fronteer-kr/14d7f779d52a21ac2f16 에서 변형
