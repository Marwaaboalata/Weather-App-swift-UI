//
//  HomeViewModel.swift
//  Weather App
//
//  Created by marwa on 16/05/2024.
//

import Foundation
class HomeViewModel {
    
    var locationManager = CurrentLocation()
    var currentWeatherClosure : (CurrentWeather)->() = {_ in }
    var forecastClosure : (Forecast)->() = {_ in }
    var locationClosure : (Location)->() = {_ in }
    var lat : Double?
    var long : Double?
    


    func getData(lat : Double , long : Double){
        ApiManager.fetchData(lat: lat ,long: long) { [weak self] res in
            switch res {
            case .success(let res) :
                print("success")
                self?.currentWeatherClosure((res.current)!)
                self?.forecastClosure((res.forecast)!)
                self?.locationClosure(res.location!)
            case .failure(_):
                print("error")
            }
        }
    }
}
