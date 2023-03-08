//
//  AddCityViewModel.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import WeatherAPI

class AddCityViewModel {
    
    let results: Bindable<[Weather]> = Bindable([])
    let error: Bindable<String?> = Bindable(nil)
    let isButtonEnabled: Bindable<Bool> = Bindable(false)
    let isLoadingEnabled: Bindable<Bool> = Bindable(false)
    let weatherApi = WeatherService()
    
    var searchText: String? = nil {
        didSet { isButtonEnabled.value = isCharactersReached() }
    }
    
    // MARK: SearchAction

    func performSearch() {
        guard let gSearchText = searchText else { return }
        
        let search = gSearchText.addingPercentEncoding(
            withAllowedCharacters: .urlHostAllowed
        ) ?? ""
        self.isLoadingEnabled.value = true
        weatherApi.getCityByName(name: search, limit: 5) { result in
            switch result {
            case .success(let weather):
                self.isLoadingEnabled.value = false
                self.results.value = [weather]
                
            case .error(_):
                self.isLoadingEnabled.value = false
                self.error.value = "*** ERROR ***"
                break
            }
        }
        
    }
    
    func getSearchResultVM(at index: Int) -> SearchResultViewModel {
        let item = results.value[index]
        return SearchResultViewModel(searchResult: item)
    }
    
    func saveCity(city:Weather) {
        let context = CoreDataManager.shared.context
        
        let weatherToStore = CDWeatherDetails(context: CoreDataManager.shared.context)
        weatherToStore.id = Int16(city.weather?.first?.id ?? 0)
        weatherToStore.main = city.weather?.first?.main ?? ""
        weatherToStore.desc = city.weather?.first?.description ?? ""
        weatherToStore.icon = city.weather?.first?.icon ?? ""

        let mainToStore = CDMain(context: CoreDataManager.shared.context)
        mainToStore.temp = city.main?.temp ?? 0
        mainToStore.feelsLike = city.main?.feelLike ?? 0
        mainToStore.pressure = city.main?.pressure ?? 0
        mainToStore.humidity = Int16(city.main?.humidity ?? 0)
        
        let windToStore = CDWind(context: CoreDataManager.shared.context)
        windToStore.deg = city.wind?.deg ?? 0
        windToStore.speed = city.wind?.speed ?? 0
        
        let locationToStore = CDCoord(context: CoreDataManager.shared.context)
        locationToStore.lat = city.coord?.lat ?? 0
        locationToStore.lon = city.coord?.lon ?? 0
        
        let sysToStore = CDSys(context: CoreDataManager.shared.context)
        sysToStore.type = Int16(city.sys?.type ?? 0)
        sysToStore.country = city.sys?.country ?? ""

        let cloudsToStore = CDClouds(context: CoreDataManager.shared.context)
        cloudsToStore.all = Int16(city.clouds?.all ?? 0)
        
        let cityToStore = CDWeather(context: context)
        cityToStore.name = city.name
        cityToStore.addToWeather(weatherToStore)
        cityToStore.main = mainToStore
        cityToStore.wind = windToStore
        cityToStore.clouds = cloudsToStore
        cityToStore.sys = sysToStore
        cityToStore.coord = locationToStore

        do{
            try context.save()
        }
        catch{
            print("Error while saving Employee Data \(error.localizedDescription)")
        }
    }
}

private extension AddCityViewModel {
    func isCharactersReached() -> Bool {
        guard let searchText = searchText else { return false }
        return searchText.count >= 3
    }
}
