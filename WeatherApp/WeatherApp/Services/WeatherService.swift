//
//  WeatherService.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import WeatherAPI
import CoreData
import UIKit

public class WeatherService {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    public func getCityByName(name: String,limit:Int,completion: @escaping (Result<Weather>) -> Void) {
        let persistentContainer = appDelegate.persistentContainer
        let decoder = JSONDecoder()
        let managedObjectContext = persistentContainer.viewContext
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.context else { fatalError("cannot find context key") }
        decoder.userInfo[codingUserInfoKeyManagedObjectContext] = managedObjectContext
        let weatherService = APIManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version,persistanceContainer: persistentContainer)
        weatherService.send(to: "weather", decoder: decoder, with: ["q": name], completion: completion)
    }
    
    public func getWeatherForLocation(latitude: String, longitude: String, completion: @escaping (Result<Weather>) -> Void) {
        let persistentContainer = appDelegate.persistentContainer
        let decoder = JSONDecoder()
        let managedObjectContext = persistentContainer.viewContext
        guard let codingUserInfoKeyManagedObjectContext = CodingUserInfoKey.context else { fatalError("cannot find context key") }
        decoder.userInfo[codingUserInfoKeyManagedObjectContext] = managedObjectContext
        let weatherService = APIManager(key: API_Key,apiUrl: API_BASE_URL,version: API_Version,persistanceContainer: persistentContainer)
        weatherService.send(to: "weather", decoder: decoder, with: ["lat": latitude, "lon": longitude], completion: completion)
    }
}
