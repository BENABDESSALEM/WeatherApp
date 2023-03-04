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
        didSet { isButtonEnabled.value = getEnabledFlowStatus() }
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
}

private extension AddCityViewModel {
    func getEnabledFlowStatus() -> Bool {
        guard let gSearchText = searchText else { return false }
        return gSearchText.count >= 3
    }
}
