//
//  SearchResultViewModel.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation
import WeatherAPI

class SearchResultViewModel {
    
    public var searchResult: Weather
    
    init(searchResult: Weather) {
        self.searchResult = searchResult
    }
    
    var trackName: String {
        searchResult.name ?? "---"
    }
    
    var collectionName: String {
        searchResult.name ?? "---"
    }
}

class SearchPersistedViewModel {
    
    public var searchResult: CDWeather
    
    init(searchResult: CDWeather) {
        self.searchResult = searchResult
    }
    
    var trackName: String {
        searchResult.name ?? "---"
    }
    
    var collectionName: String {
        searchResult.name ?? "---"
    }
}
