//
//  WheatherNearLocationsModel.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 23.10.2021.
//
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherLocationModel = try? newJSONDecoder().decode(WeatherLocationModel.self, from: jsonData)

import Foundation
import Alamofire


// MARK: - WeatherLocationModelElement
class WeatherLocationModel :Codable {
    let distance: Int?
    let title: String
    let locationType: String
    let woeid: Int
    let lattLong: String
    
    init(distance: Int?, title: String, locationType: String, woeid: Int, lattLong: String) {
        self.distance = distance
        self.title = title
        self.locationType = locationType
        self.woeid = woeid
        self.lattLong = lattLong
    }
    
    
    
    
   
    
    
    
    
}
extension WeatherLocationModel: Identifiable {
    var id: UUID { return UUID() }
}



