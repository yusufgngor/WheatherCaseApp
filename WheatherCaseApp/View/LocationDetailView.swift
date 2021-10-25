//
//  LocationDetailView.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 23.10.2021.
//

import Foundation
import SwiftUI



struct LocationDetailView: View {
    
    @StateObject private var  location = LocationDetailViewModel()
    
    
    let woeid,city : String
    var body : some View{
        VStack {
            Text(city)
            switch location.state
            {
            case .error(error: let error) :
                Text(error ?? "Error")
            case .loading
                :ProgressView()
            case .completed :
                List(location.locationdetail.reversed(),id:\.id){item in
                    LocTile(model: item)
                }
            }
        }.onAppear{location.getLocationDetailForSevenDay(woeid: woeid)}
    }
}

struct LocTile : View {
    
    let model : WeatherResponseModel
    
    var minTemp : String {
        if model.minTemp != nil {
         return  "Min : \(String(format: "%.01f", model.minTemp! ))"
        }
        return "-"
        
    }
    var maxTemp : String {
        if model.minTemp != nil {
         return  "Max : \(String(format: "%.01f", model.maxTemp!))"
        }
        return "-"
        
    }
    
    var body : some View  {
        
        ZStack {
            VStack(spacing: 1.0){
                Text(model.applicableDate ?? "" ).font(.headline)
                Text(model.weatherStateName ?? "" ).font(.headline)
                
                HStack(alignment: .center){
                    Image(systemName: "location.circle")
                        .foregroundColor(.green)
                    Spacer()
                    Text(minTemp)
                        .multilineTextAlignment(.leading)
                    Text(maxTemp)
                        .multilineTextAlignment(.leading)
                }.padding()
                
            }
            RoundedRectangle(cornerRadius: 25).stroke().foregroundColor(.gray)
        }
        
        
    }
    
    
    
    
    
    
}
