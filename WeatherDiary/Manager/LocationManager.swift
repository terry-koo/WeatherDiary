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
    @Published var locality: String?
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
    func fetchLocality(location: CLLocation) {
        
        let geocoder = CLGeocoder()
        
        geocoder.reverseGeocodeLocation(location, preferredLocale: Locale(identifier: "Ko-kr")) { placemarks, error in
            guard error == nil, let locality = placemarks?.last?.locality else { return }
            self.locality = locality
            
        }
    }
}
