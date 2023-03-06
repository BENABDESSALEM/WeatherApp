# WeatherApp

WeatherApp is a app that use a WeatherAPI Swift Package Module written in Swift 5.

### Requirements:
iOS 11.0+

### Installation:
In order to use the WeatherAPI Swift Package Module , you can integrate the framework into your project manually or by installing it from :
https://github.com/BENABDESSALEM/WeatherAPI

### Code implementation:

#### First:

import WeatherAPI in your view controller's
```
import WeatherAPI
```

#### Then:

Create a WeatherService.swift File:
```
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

```
#### Finally:

Create an instance of your WeatherService file.

```
let weatherApi = WeatherService()
```
Next you can call the api and get your response as the following example:

```
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
```
