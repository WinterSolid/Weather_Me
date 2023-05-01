//
//  ContentView.swift
//  WeatherMe
//
//  Created by Zakee Tanksley on 4/30/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location{
                Text("Your Location is \(location.latitude),\(location.longitude)")
            } else {
                if locationManager.isLoading {
                    LoadingView()
                    
                } else {
                    WelcomeView().environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.659, saturation: 0.787, brightness: 0.354)).preferredColorScheme(.dark)
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
