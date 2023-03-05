//
//  CityWeatherDetailsViewModel.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 5/3/2023.
//

import Foundation

class CityWeatherDetailsViewModel {
    var weather : Weather?
    internal let kKelvinZeroInCelsius = 273.15
    internal let kFahrenheitZeroInKelvin = -459.67

    public func toCelsius(kelvin: Double) -> Double {
        return kelvin - kKelvinZeroInCelsius
    }

    func toFahrenheit(celsius: Double) -> Double {
        return celsius * 9 / 5 + 32
    }
}
