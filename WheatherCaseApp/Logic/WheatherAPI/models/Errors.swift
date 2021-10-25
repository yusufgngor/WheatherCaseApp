//
//  Errors.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 23.10.2021.
//

import Foundation



enum NetworkError : Error {
    case badRequest(error :String?)
    case decodingError
    case badURL
    
    
    
    
    
}
