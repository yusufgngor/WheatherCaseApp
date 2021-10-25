// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weatherLocationModel = try? newJSONDecoder().decode(WeatherLocationModel.self, from: jsonData)

import Foundation

class WeatherResponseModel : Codable,Identifiable {
    let id: Int
    let weatherStateName, weatherStateAbbr, windDirectionCompass, created: String?
    let applicableDate: String?
    let minTemp, maxTemp, windSpeed: Double?
    
    let windDirection: Double
    let airPressure : Double?
    let humidity: Int?
    let visibility: Double?
    let predictability: Int?

    init(id: Int, weatherStateName: String, weatherStateAbbr: String, windDirectionCompass: String, created: String, applicableDate: String, minTemp: Double, maxTemp: Double, windSpeed: Double, windDirection: Double, airPressure: Double?, humidity: Int, visibility: Double, predictability: Int) {
        self.id = id
        self.weatherStateName = weatherStateName
        self.weatherStateAbbr = weatherStateAbbr
        self.windDirectionCompass = windDirectionCompass
        self.created = created
        self.applicableDate = applicableDate
        self.minTemp = minTemp
        self.maxTemp = maxTemp
        self.windSpeed = windSpeed
        self.windDirection = windDirection
        self.airPressure = airPressure
        self.humidity = humidity
        self.visibility = visibility
        self.predictability = predictability
    }
}
