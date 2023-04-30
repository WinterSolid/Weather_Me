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
            WelcomeView().environmentObject(locationManager)
        }
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
