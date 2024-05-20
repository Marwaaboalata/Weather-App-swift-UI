//
//  currentLocation .swift
//  Weather App
//
//  Created by marwa on 15/05/2024.
//


import Foundation
import CoreLocation

class CurrentLocation: NSObject, ObservableObject, CLLocationManagerDelegate {
     var locationManager = CLLocationManager()
     @Published var currentLocation: CLLocation?
    
    override init() {
        super.init()
        self.locationManager.delegate = self
        self.locationManager.requestWhenInUseAuthorization()
        self.locationManager.startUpdatingLocation()
    }
    
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        self.currentLocation = location
        print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
       
    }
}


