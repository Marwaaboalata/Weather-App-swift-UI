//
//  Response.swift
//  Weather App
//
//  Created by marwa on 13/05/2024.
//

import Foundation
import Foundation

struct Response: Decodable {
    var location: Location?
    var current: CurrentWeather?
    var forecast: Forecast?
}

struct Location: Decodable {
    var name: String?
    var region: String?
    var country: String?
    var lat: Double?
    var lon: Double?
    var tzId: String?
    var localtimeEpoch: Int?
    var localtime: String?
}

struct CurrentWeather: Decodable {
    var lastUpdatedEpoch: Int?
    var lastUpdated: String?
    var tempC: Double?
    var tempF: Double?
    var isDay: Int?
    var condition: Condition?
    var windMph: Double?
    var windKph: Double?
    var windDegree: Int?
    var windDir: String?
    var pressureMb: Double?
    var pressureIn: Double?
    var precipMm: Double?
    var precipIn: Double?
    var humidity: Int?
    var cloud: Int?
    var feelslikeC: Double?
    var feelslikeF: Double?
    var visKm: Double?
    var visMiles: Double?
    var uv: Double?
    var gustMph: Double?
    var gustKph: Double?
    var airQuality: AirQuality?
}

struct Condition: Decodable {
    var text: String?
    var icon: String?
    var code: Int?
}

struct AirQuality: Decodable {
    var co: Double?
    var no2: Double?
    var o3: Double?
    var so2: Double?
    var pm25: Double?
    var pm10: Double?
    var usEpaIndex: Int?
    var gbDefraIndex: Int?


}

struct Forecast: Decodable {
    var forecastday: [ForecastDay]?
}

struct ForecastDay: Decodable  {
 //   var id: Int

    var date: String?
    var dateEpoch: Int?
    var day: Day?
    var astro: Astro?
    var hour: [Hour]?

}

struct Day: Decodable {
    var maxtempC: Double?
    var maxtempF: Double?
    var mintempC: Double?
    var mintempF: Double?
    var avgtempC: Double?
    var avgtempF: Double?
    var maxwindMph: Double?
    var maxwindKph: Double?
    var totalprecipMm: Double?
    var totalprecipIn: Double?
    var totalsnowCm: Double?
    var avgvisKm: Double?
    var avgvisMiles: Double?
    var avghumidity: Int?
    var dailyWillItRain: Int?
    var dailyChanceOfRain: Int?
    var dailyWillItSnow: Int?
    var dailyChanceOfSnow: Int?
    var condition: Condition?
    var uv: Double?
    var airQuality: AirQuality?
}

struct Astro: Decodable {
    var sunrise: String?
    var sunset: String?
    var moonrise: String?
    var moonset: String?
    var moonPhase: String?
    var moonIllumination: Int?
    var isMoonUp: Int?
    var isSunUp: Int?
}

struct Hour: Decodable {
    var timeEpoch: Int?
    var time: String?
    var tempC: Double?
    var tempF: Double?
    var isDay: Int?
    var condition: Condition?
    var windMph: Double?
    var windKph: Double?
    var windDegree: Int?
    var windDir: String?
    var pressureMb: Double?
    var pressureIn: Double?
    var precipMm: Double?
    var precipIn: Double?
    var snowCm: Double?
    var humidity: Int?
    var cloud: Int?
    var feelslikeC: Double?
    var feelslikeF: Double?
    var windchillC: Double?
    var windchillF: Double?
    var heatindexC: Double?
    var heatindexF: Double?
    var dewpointC: Double?
    var dewpointF: Double?
    var willItRain: Int?
    var chanceOfRain: Int?
    var willItSnow: Int?
    var chanceOfSnow: Int?
    var visKm: Double?
    var visMiles: Double?
    var gustMph: Double?
    var gustKph: Double?
    var uv: Double?
    var airQuality: AirQuality?
}

 func getDate(value:Int) -> String {
    let date = Date()
    let calendar = Calendar.current
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EEEE"
 
    let day = calendar.date(byAdding: .day, value: value, to: date)!
    let formattedDay = dateFormatter.string(from: day)
 
   return (formattedDay)
    
}
func getHours(value: Int) -> String {
    let date = Date()
    let calendar = Calendar.current
    
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "h a"
    
    let hour = calendar.date(byAdding: .hour, value: value, to: date)!
    let formattedHour = dateFormatter.string(from: hour)
 
    return formattedHour
}
