//
//  WeatherViewModel.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 23.10.2021.
//

import Foundation
import SwiftUI

class LocationDetailViewModel : ObservableObject {
    
    @Published var locationdetail = [WeatherResponseModel]()
    @Published var state = ViewModelStates.loading
    
    
    // to fetch wheather data of given city according to date
    func getLocationDetail ( woeid:String ,year:Int,month:Int,day:Int ){
        
        WheatherAPI.getDetailofLocation(woeid:woeid,year:year,month:month,day:day) { result in
            switch result {
            case .success(let locationDetail):
                guard let locdetail =  locationDetail.first else {self.state = .error(error: "Data Handling Error"); return }
                self.locationdetail.append(locdetail)
                
            case .failure(let error):
                self.state = .error(error:error.localizedDescription);
                
            }
            
        }
    }
    
    func getLocationDetailForSevenDay (woeid : String) {
        
        self.state = .loading
        var date = Date() // today's date
        
        var datecom = DateComponents(); //create for add 1 day
        datecom.day = 1;
        
        DispatchQueue.main.async {
            for _ in 1...7 {
                let year =  Calendar.current.component(.year, from: date)
                let month =  Calendar.current.component(.month, from: date)
                let day =  Calendar.current.component(.day, from: date)
                
                // print("\(year),\(month),\(day),")
                self.getLocationDetail(woeid: woeid, year: year, month: month, day: day)
                date = Calendar.current.date(byAdding: datecom , to: date)!
            }
            
            self.state = .completed
        }
    }
}
/*
 
 
 struct WeatherLocationDetailItemViewModel : Identifiable {
 
 
 private let weatherLocation: WeatherResponseModel
 
 init (_ loc: WeatherResponseModel)
 {
 self.weatherLocation = loc
 }
 let id = UUID();
 var wid : String {String(weatherLocation.id)};
 var max_temp :String { weatherLocation.maxTemp == nil ?"" : String(format:"%.2f" ,weatherLocation.maxTemp!)};
 var minTemp :String {weatherLocation.minTemp == nil ?"" :String(format:"%.2f",weatherLocation.minTemp!)};
 var weatherStateAbbr :String {weatherLocation.weatherStateAbbr == nil ?"" : weatherLocation.weatherStateAbbr!};
 var date = ""
 
 }
 */
