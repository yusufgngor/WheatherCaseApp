//
//  WeatherViewModel.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 23.10.2021.
//

import Foundation

class WeatherViewModel : ObservableObject {
    
    @Published var locations = [WeatherLocationModel]()
    @Published var state = ViewModelStates.loading
    
    
    func getLocations (lat:Double,long:Double){
        state = .loading
        WheatherAPI.fetchLocations(lat: lat, long: long) { result
            in
            switch result {
            case .success(let rlocations):
                    self.locations = rlocations
                    self.state = .completed
                
            case .failure(let error):
                print(error)
                self.state = .error(error: error.localizedDescription)
            }
        }
        state = .completed
    }
           
}

/*
struct WeatherLocationItemViewModel : Identifiable{
    let id = UUID();
    private let weatherLocation: WeatherLocationModel
    
    init (_ loc: WeatherLocationModel)
    {
        self.weatherLocation = loc
    }
    var title: String {weatherLocation.title}
    var woeid: String {String(weatherLocation.woeid)}
    var distance: String {return weatherLocation.distance == nil ?  "" : String(weatherLocation.distance!)}
    
    
}
*/
