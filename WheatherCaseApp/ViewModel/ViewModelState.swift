//
//  ViewModelState.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 25.10.2021.
//

import Foundation


enum ViewModelStates {
    case loading
    case completed
    case error(error : String?)
    
}
