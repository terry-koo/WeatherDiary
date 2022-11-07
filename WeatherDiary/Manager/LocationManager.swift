//
//  LocationManager.swift
//  WeatherDiary
//
//  Created by KiWoong Hong on 2022/11/02.
//

import SwiftUI
import CoreLocation

class LocationManager: NSObject, ObservableObject {
    @Published var currentLocation: CLLocation?
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest // ??
        locationManager.distanceFilter = kCLDistanceFilterNone // ??
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        locationManager.delegate = self
    }
}

extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil else { return }
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}

extension LocationManager {
    private func fetchCurrentLocationName() -> String {
        
        let geocoder = CLGeocoder()
        return ""
    }
}
