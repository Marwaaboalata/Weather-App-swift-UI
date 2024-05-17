//
//  DayDetailView.swift
//  Weather App
//
//  Created by marwa on 14/05/2024.
//

import SwiftUI

struct DayDetailView: View {
    @State  var day : ForecastDay
    
    init(daysArray: ForecastDay) {
        self.day = daysArray
    }
    
    var body: some View {
        VStack{
            List {
                if let hours = day.hour {
                    ForEach(hours.indices , id: \.self) { index in
                        HStack {
                            
                            if let time = hours[index].time {
                                // Text("Hour: \(time)")
                                Text(getHours(value:index))
                            } else {
                                Text("Hour: N/A")
                            }
                            
                            Image("cloudicon")
                                .resizable()
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle()
                                    .stroke(Color.white, lineWidth: 2))
                            if let temp = hours[index].tempC {
                                Text("temp: \(Int(temp)) °C")
                            } else {
                                Text("Hour: N/A")
                            }
                        }.padding(20)
                        
                    }
                } else {
                    Text("No hourly data available")
                }
            }
        }.background(Image("weatherBack"))
    }
    
}

struct DayDetailView_Previews: PreviewProvider {
    static var previews: some View {
        DayDetailView(daysArray: ForecastDay())
    }
}
