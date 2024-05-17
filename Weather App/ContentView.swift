//
//  ContentView.swift
//  Weather App
//
//  Created by marwa on 13/05/2024.
//

import SwiftUI
import CoreData
import MapKit
import CoreLocation


struct ContentView: View {
    @State private var latitude: Double = 0
    @State private var longitude: Double = 0
    @State private var hum: Int = 0
    @State private var vis: Double = 0
    @State private var pres: Double = 0
    @State private var feel: Double = 0
    @State private var city: String = " "
    @State private var clouds: String = " "
    @State private var temp: String = " "
    @State private var imageUrl: String = " "
    @State  var daysArray : [ForecastDay] = []
    let day = Date()
   
    
    init(){
        let locationManager = CLLocationManager()
        locationManager.requestWhenInUseAuthorization()
        latitude = (CLLocationManager().location?.coordinate.latitude ?? 0)!
        longitude = (CLLocationManager().location?.coordinate.longitude ?? 0)!
        
    }
    var body: some View {
        var viewModel = HomeViewModel()
        let isMorning = Calendar.current.component(.hour, from: day) >= 5 && Calendar.current.component(.hour, from: day) < 15
        
          NavigationView {
        
              VStack{
                  VStack{
                      Text(city).bold().foregroundColor(.white).font(.system(size: 50))
                      Text((temp + "°C")).bold().foregroundColor(.white).font(.system(size: 50))
                      Text(clouds).bold().foregroundColor(.white).font(.system(size: 50))
                      AsyncImage(url: URL(string: "https:" + imageUrl ))
                                 
                      VStack{
                          List {
                              ForEach(daysArray.indices, id: \.self) { index in
                                  NavigationLink(destination: DayDetailView(daysArray: daysArray[index])){
                                      HStack {
                                          Text(getDate(value: index))
                                          AsyncImage(url: URL(string: "https:" + (daysArray[index].hour?[index].condition?.icon)!))
                                          Text(String(format: "%.2f", (daysArray[index].hour?[index].tempC)!) + "°C")
                                      }.background(Image("weatherBack"))
                                      .frame(width: 400)
                                      .border(Color.blue)
                                  }
                                  //.navigationBarTitle("Days")
                              }
                          }
                      }

                      VStack{
                          HStack{
                              Text("Humidity      ").bold().foregroundColor(.white).font(.system(size: 40))
                              Text("Visibility").bold().foregroundColor(.white).font(.system(size: 40))
                          }
                          HStack{
                              Text("\(Int(hum ))%               ").bold().foregroundColor(.white).font(.system(size: 30))
                              Text("\(Int(vis)) KM").bold().foregroundColor(.white).font(.system(size: 30))
                          }
                          HStack{
                              Text("Feels like      ").bold().foregroundColor(.white).font(.system(size: 40))
                              Text("Presure").bold().foregroundColor(.white).font(.system(size: 40))
                          }
                          HStack{
                              Text("\(Int(feel) ) °C                       ").bold().foregroundColor(.white).font(.system(size: 30))
                              Text("\(Int(pres))").bold().foregroundColor(.white).font(.system(size: 30))
                          }
                      }
                  }
                 // .background(Image("weatherBack")
                   // .edgesIgnoringSafeArea(.all))
                  .frame(maxWidth: .infinity, maxHeight: .infinity)
                              .background(
                                  Image(isMorning ? "morning" : "weatherBack")
                                      .resizable()
                                      .aspectRatio(contentMode: .fill)
                                      .edgesIgnoringSafeArea(.all))
                  .onAppear {
                    //  self.callApi()
                  }
                  
              }
            
        }
          .onAppear{
             
              viewModel.forecastClosure = {
                  res in
                  self.daysArray = (res.forecastday)!
                  
              }
              viewModel.currentWeatherClosure = {
                  res in
                  hum = (res.humidity ?? 0)!
                  vis = (res.uv ?? 0)!
                  pres = (res.pressureIn ?? 0)!
                  feel = (res.feelslikeF ?? 0)!
                  temp = "\(res.tempC ?? 0)"
                  clouds = "\(res.condition?.text ?? "0")"
                  imageUrl = (res.condition?.icon)!
              }
              viewModel.locationClosure = {
                  res in
                  city = (res.name ?? "Def")!
              }
              
              viewModel.getData()
          }
 
    }
   

    /* func callApi(){

        ApiManager.fetchData { res in
            switch res {
            case .success(let res) :
                print("success")
                print("lat" , latitude )
                print("long",longitude )
                DispatchQueue.main.async {
                    hum = (res.current?.humidity ?? 0)!
                    vis = (res.current?.uv ?? 0)!
                    pres = (res.current?.pressureIn ?? 0)!
                    feel = (res.current?.feelslikeF ?? 0)!
                    temp = "\(res.current?.tempC ?? 0)"
                   
                    clouds = "\(res.current?.condition?.text ?? "0")"
                    imageUrl = (res.current?.condition?.icon)!
                    daysArray = (res.forecast?.forecastday)!
                    city = (res.location?.name ?? "Def")!
                    
                }
                
            

            case .failure(_):
                print("error")
            }
        }
    } */


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
