//
//  WelcomeView.swift
//  WeatherMe
//
//  Created by Zakee Tanksley on 4/30/23.
//

import SwiftUI

struct WelcomeView: View {
    @EnvironmentObject var locationManager: LocationManager
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Text("Melcome to WeatherMe")
                    .bold().font(.title)
                
                Text("Share your location for weather in your area ")
                    .padding()
                
            }
            .multilineTextAlignment(.center)
            .padding()
            
//            LocationButton(.shareCurrentLocation) {
//                locationManager.requestLocation()
//
//            }
//
//            .cornerRadius(30)
//            .SymbolVariants(.fill)
//            .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity,maxHeight: .infinity)
    }
}
        

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
