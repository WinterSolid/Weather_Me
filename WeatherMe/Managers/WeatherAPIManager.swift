//
//  WeatherAPIManager.swift
//  WeatherMe
//
//  Created by Zakee Tanksley on 4/30/23.
//

import Foundation
import CoreLocation

class WeatherAPIManager {
    func getCurrentWeather(latittude: CLLocationDegrees,longitude: CLLocationDegrees) async throws -> ResponseBody {
        guard let url = URL(string:
                                "http://api.openweathermap.org/geo/1.0/reverse?lat=\(latittude)&lon=\(longitude)&limit={limit}&appid=\(KEY)&units=metric") else { fatalError("Missing URL")} //TODO: ADD KEY
        
        let urlRequest = URLRequest(url: url)
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {fatalError("Error Fetching Data") }
        
        let decodedData = try JSONDecoder().decode(ResponseBody.self, from: data)
        
        return decodedData
        
    }
}
/// Model of the response body OpenWeather API
struct ResponseBody: Decodable {
    var coord: CoordinatesResponse
    var weather: [WeatherResponse]
    var main: MainResponse
    var name: String
    var wind: WindResponse

    struct CoordinatesResponse: Decodable {
        var lon: Double
        var lat: Double
    }

    struct WeatherResponse: Decodable {
        var id: Double
        var main: String
        var description: String
        var icon: String
    }

    struct MainResponse: Decodable {
        var temp: Double
        var feels_like: Double
        var temp_min: Double
        var temp_max: Double
        var pressure: Double
        var humidity: Double
    }
    
    struct WindResponse: Decodable {
        var speed: Double
        var deg: Double
    }
}

extension ResponseBody.MainResponse {
    var feelsLike: Double { return feels_like }
    var tempMin: Double { return temp_min }
    var tempMax: Double { return temp_max }
}
