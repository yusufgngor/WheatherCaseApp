//
//  ContentView.swift
//  WheatherCaseApp
//
//  Created by Yusuf Güngör on 23.10.2021.
//

import SwiftUI

struct ContentView: View {
    
    // To fetch wheather data
    @StateObject private var  locations = WeatherViewModel()
    // to fetch users location
    @StateObject var locationManager = LocationManager()
    
    
    //user's location latitude
    var userLatitude: Double {
        return locationManager.lastLocation?.coordinate.latitude ?? 0
    }
    //user's location latitude
    var userLongitude: Double {
        return locationManager.lastLocation?.coordinate.longitude ?? 0
    }
    
    var body: some View {
        
        //Looking for users location
        switch locationManager.locationStatus
        {
            
    
        case .notDetermined:
            VStack
            {
                Text("Waiting For Accepting Location Permissions")
                ProgressView()
                
            }
        case .restricted, .denied :
            VStack
            {
                Text("You have rejected to share your location")
                
            }
            
                //if location could be handled then...
        case .authorizedAlways, .authorizedWhenInUse  :
            NavigationView {
                
                //start to fetching wheather data and display some screens to user according to states
                switch locations.state
                {
                case .loading:
                    ProgressView()
                case .error(error: let error):
                    Text(error ?? "Error")
                
                 // When Completed
                case .completed :
                    List(locations.locations) { item in
                        //redirect to user LocationDetail page by parsing cities id and name
                        NavigationLink(destination: LocationDetailView(woeid:String(item.woeid),city:item.title) ) {
                            HStack {
                               /* Image(systemName: "location.circle")
                                    .foregroundColor(.green)*/
                                VStack(alignment: .leading) {
                                    Text(item.title)
                                        .font(.headline)
                                    
                                        
                                    Text(item.distance != nil ? "\(item.distance!)m" : " - " )
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                        .multilineTextAlignment(.leading)
                                }
                            }
                        }
                    }.navigationBarTitle(Text("Main Page")) 
                }
            }.onAppear{locations.getLocations(lat: userLatitude, long: userLongitude)}
        default :
            Text("Loading..")
            ProgressView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
