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
        
        let weatherToStore = WeatherDetails(context: CoreDataManager.shared.context)
        weatherToStore.id = city.weather?.first?.id ?? 0
        weatherToStore.main = city.weather?.first?.main ?? ""
        weatherToStore.desc = city.weather?.first?.desc ?? ""
        weatherToStore.icon = city.weather?.first?.icon ?? ""

        let mainToStore = Main(context: CoreDataManager.shared.context)
        mainToStore.temp = city.main?.temp ?? 0
        mainToStore.feelsLike = city.main?.feelsLike ?? 0
        mainToStore.pressure = city.main?.pressure ?? 0
        mainToStore.humidity = city.main?.humidity ?? 0
        
        let windToStore = Wind(context: CoreDataManager.shared.context)
        windToStore.deg = city.wind?.deg ?? 0
        windToStore.speed = city.wind?.speed ?? 0
        
        let locationToStore = Coord(context: CoreDataManager.shared.context)
        locationToStore.lat = city.coord?.lat ?? 0
        locationToStore.lon = city.coord?.lon ?? 0
        
        let sysToStore = Sys(context: CoreDataManager.shared.context)
        sysToStore.type = city.sys?.type ?? 0
        sysToStore.id = city.sys?.id ?? 0
        sysToStore.country = city.sys?.country ?? ""
        sysToStore.sunset = city.sys?.sunset ?? 0
        sysToStore.sunrise = city.sys?.sunrise ?? 0

        let cityToStore = Weather(context: context)
        cityToStore.id = city.id
        cityToStore.name = city.name
        cityToStore.addToWeather(weatherToStore)
        cityToStore.main = mainToStore
        cityToStore.wind = windToStore
        cityToStore.clouds = city.clouds
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
