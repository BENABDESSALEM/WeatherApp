//
//  CityListViewModel.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import CoreLocation
import CoreData
import UIKit

class CityListViewModel {
    
    let results: Bindable<[Weather]> = Bindable([])
    let addedCities: Bindable<[Weather]> = Bindable([])
    var persistedCities: Bindable<[CDWeather]> = Bindable([])
    let error: Bindable<String?> = Bindable(nil)
    let isButtonEnabled: Bindable<Bool> = Bindable(false)
    let isLoadingEnabled: Bindable<Bool> = Bindable(false)
    let isListAvailable: Bindable<Bool> = Bindable(false)
    let weatherApi = WeatherService()
    var currentLocation: CLLocation!
    var searchText: String? = nil {
        didSet { isButtonEnabled.value = isCharactersCountReached() }
    }
    
    func getSearchResultVM(at index: Int) -> SearchResultViewModel {
        let city = results.value[index]
        return SearchResultViewModel(searchResult: city)
    }
    func getCity(at index: Int) -> SearchResultViewModel {
        let addedCity = addedCities.value[index]
        return SearchResultViewModel(searchResult: addedCity)
    }
    
    func getStoredCity(at index: Int) -> SearchPersistedViewModel {
        let addedCity = persistedCities.value[index]
        return SearchPersistedViewModel(searchResult: addedCity)
    }
    
    func getPersistedCities() {
     let request = NSFetchRequest<CDWeather>(entityName: "CDWeather")
        do {
            persistedCities.value =  try CoreDataManager.shared.context.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func isCharactersCountReached() -> Bool {
        guard let searchText = searchText else { return false }
        return searchText.count >= 3
    }
    
    func checkInfoVisibility() {
        isListAvailable.value = persistedCities.value.count != 0
    }
    
    func getMyCityWeather()  {
        let locManager = CLLocationManager()
        locManager.requestWhenInUseAuthorization()
        if
            CLLocationManager.authorizationStatus() == .authorizedWhenInUse ||
                CLLocationManager.authorizationStatus() ==  .authorizedAlways
        {
            currentLocation = locManager.location
            weatherApi.getWeatherForLocation(latitude: "\(currentLocation.coordinate.latitude)", longitude: "\(currentLocation.coordinate.longitude)") { result in
                switch result {
                case .success(let weather):
                    self.isLoadingEnabled.value = false
                    self.addedCities.value.append(contentsOf: [weather])
                case .error(_):
                    self.isLoadingEnabled.value = false
                    self.error.value = "#*** ERROR ***#"
                    break
                }
            }
        }
    }
}
