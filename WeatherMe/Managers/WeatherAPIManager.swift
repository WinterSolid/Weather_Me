//
//  WeatherAPIManager.swift
//  WeatherMe
//
//  Created by Zakee Tanksley on 4/30/23.
//

import Foundation
import CoreLocation

class WeatherAPIManager {
    func getCurrentWeather(latittude: CLLocationDegrees,longitude: CLLocationDegrees) {
        guard let url = URL(string:
                                "http://api.openweathermap.org/geo/1.0/reverse?lat=\(latittude)&lon=\(longitude)&limit={limit}&appid=\(KEY)&units=metric") else { fatalError("Missing URL")}
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error Fetching Data") }
        
    }
}
// TODO: ADD REPONSE BODY JSON TO SWIFT
