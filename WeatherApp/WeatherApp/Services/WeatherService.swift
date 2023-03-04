//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import WeatherAPI

public class WeatherService {
    
    let weatherService = APIManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version)
    
    public func getCityByName(name: String,limit:Int,completion: @escaping (Result<Weather>) -> Void) {
        weatherService.send(to: "weather", with: ["q": name], completion: completion)
    }
    
    public func getWeatherForLocation(latitude: String, longitude: String, completion: @escaping (Result<Weather>) -> Void) {
        weatherService.send(to: "weather", with: ["lat": latitude, "lon": longitude], completion: completion)
    }

}
