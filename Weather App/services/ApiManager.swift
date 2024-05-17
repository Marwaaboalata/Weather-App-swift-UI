//
//  ApiManager.swift
//  Weather App
//
//  Created by marwa on 13/05/2024.
//

import Foundation

let  Api_Key : String = "f2f9ec409c67b8498f33c2bf4c7fb7e7"
let  Base_URL : String = "https://api.openweathermap.org/data/2.5/"
let Api_Key_Map : String = "AIzaSyALEzKGnX8Gta5jX2RArUMQgtcMtd4cYEs"
class ApiManager {
    
    static func fetchData ( completionHnadler : @escaping (Result< Response, Error>) ->()) {
            
            let url = URL(string: "https://api.weatherapi.com/v1/forecast.json?key=e6c3e07a974d4232b3d02931241305&q=30.0715495,31.015953&days=3&aqi=yes&alerts=no"
    )
            guard let newUrl = url else {return }
            print(newUrl)
            let request = URLRequest(url: newUrl)
            let session = URLSession.shared
            let task = session.dataTask(with: request){
                data,response,error in
                if let error = error {
                    completionHnadler(.failure(error))
                    return
                }
                guard let data = data else {
                    let error = NSError(domain: "NoData", code: 0, userInfo: [NSLocalizedDescriptionKey: "No data received"])
                    completionHnadler(.failure(error))
                    return
                }
                do {
                    var json = JSONDecoder()
                    json.keyDecodingStrategy = .convertFromSnakeCase
                    let response = try json.decode(Response.self, from: data)
                    completionHnadler(.success(response))
                    print("newUrl ",newUrl)
                    print("fetchWeatherFromNetwork = ",response.current!)
                    print("fetchWeatherFromNetwork = ",response.forecast?.forecastday![0])
                }
                catch {
                    print("Error ///")
                }
            }
            task.resume()
         }
        
    }
    

 
//   "https://api.weatherapi.com/v1/forecast.json?key=80a6ab61f071421a839120159241205&q=30.0715495,31.015953&days=3&aqi=yes&alerts=no"
