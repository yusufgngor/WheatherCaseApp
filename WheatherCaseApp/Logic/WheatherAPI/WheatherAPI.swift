//
//  WheatherAPI.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 23.10.2021.
//

import Foundation
import Alamofire


class WheatherAPI {
    
    
    static func getDetailofLocation(woeid:String,year:Int,month:Int,day:Int, completion: @escaping (Result <[WeatherResponseModel],NetworkError>) ->Void ) {
        
        guard let url = URL(string: "https://www.metaweather.com/api/location/\(woeid)/\(year)/\(month)/\(day)/") else {
            return completion(.failure(NetworkError.badURL))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        DispatchQueue.main.async {
            let request = AF.request(url, method:.get )
            request.validate().responseDecodable(of: [WeatherResponseModel].self,decoder: decoder    ) { (response) in
                
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(.failure(.badRequest(error: error.errorDescription)))
                    return
                    
                case .success(let data):
                    completion(.success(data))
                    return        
                }
                
            }
        }
    }
    
    static func fetchLocations(lat:Double ,long:Double,completion: @escaping (Result <[WeatherLocationModel],NetworkError>) ->Void )
    {
        guard let url = URL(string: "https://www.metaweather.com/api/location/search/?lattlong=\(lat),\(long)") else {
            return completion(.failure(NetworkError.badURL))
        }
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        DispatchQueue.main.async {
            let request = AF.request(url, method:.get )
            request.validate().responseDecodable(of: [WeatherLocationModel].self,decoder: decoder    ) { (response) in
                
                switch response.result {
                case .failure(let error):
                    print(error)
                    completion(.failure(.badRequest(error: error.errorDescription)))
                    return
                    
                case .success(let data):
                    completion(.success(data))
                    return
                    
                }
                
            }
        }
        
    }
    
    
    
}
