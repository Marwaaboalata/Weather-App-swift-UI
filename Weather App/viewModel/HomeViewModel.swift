//
//  HomeViewModel.swift
//  Weather App
//
//  Created by marwa on 16/05/2024.
//

import Foundation
class HomeViewModel {
    
//    var isDataCame : Response! {
//        didSet{
//
//        }
//    }
    var currentWeatherClosure : (CurrentWeather)->() = {_ in }
    var forecastClosure : (Forecast)->() = {_ in }
    var locationClosure : (Location)->() = {_ in }

    func getData(){
        ApiManager.fetchData { [weak self] res in
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
