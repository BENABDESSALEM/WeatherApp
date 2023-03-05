//
//  APIManager.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation

protocol ApiProtocol {
    var key: String {get}
    var apiUrl: String {get}
    var version: String {get}
    var urlSession: URLSessionProtocol {get}
    var defaultParameters: [URLQueryItem] {get}
    
    func getEndpoint() -> String
}
public protocol ApiWeatherProtocol {
    
}

public protocol ApiForecastProtocol {
    
}
public enum WeatherError: Error {
    /// invalid data from api call
    case invalidData
}

/**
 All query output are wrapped into this Enum
 */
public enum Result<T> {
    /**
     Success Result
     - Parameter T: T can be Weather of Forecast struct
     */
    case success(T)
    /**
     Error case
     - Parameter Error?: error can be nil when error are unknown
     */
    case error(Error?)
}
public class APIManager: ApiProtocol {
    /// OpenWeatherMap key
    var key: String
    /// OpenWeatherMap endpoint
    var apiUrl: String
    /// OpenWeatherMap version for API
    var version: String
    /// URLSession used for query
    var urlSession: URLSessionProtocol
    /// defaultParameters added to all query
    var defaultParameters: [URLQueryItem] = []
    
    /**
     Init kit
     
     - Parameter key: OpenWeatherMap Key
     - Parameter apiUrl: OpenWeatherMap endpoint
     - Parameter urlSession: URLSession used for query
     */
    public init(key: String,apiUrl:String,version:String,urlSession: URLSessionProtocol) {
        self.key = key
        self.apiUrl = apiUrl
        self.version = version
        self.urlSession = urlSession
        self.defaultParameters.append(URLQueryItem(name: "APPID", value: key))
    }
    
    /**
     Init kit
     
     - Parameter key: OpenWeatherMap Key
     */
    public convenience init(key: String,apiUrl: String,version: String) {
        self.init(key: key,apiUrl: apiUrl,version: version, urlSession: URLSession.shared)
    }
    
    /**
     - Returns: The full endpoint string with endpoint and version
     */
    func getEndpoint() -> String {
        return "\(apiUrl)/data/\(version)/"
    }
    func getGeoEndpoint() -> String {
        return "\(apiUrl)/geo/1.0/"
    }
    /**
     Add defaultParameter for all query
     */
    func addDefaultParameter(name: String, value: String) {
        defaultParameters.append(URLQueryItem(name: name, value: value))
    }
    
    /**
     Send request
     */
    public func send<T: Codable>(to endpoint: String, with parameters: [String: Any], completion: @escaping (Result<T>) -> Void) {
        var urlComponents = URLComponents(string: "\(getEndpoint())\(endpoint)")!
        urlComponents.queryItems = defaultParameters
        for (key, value) in parameters {
            urlComponents.queryItems?.append(URLQueryItem(name: key, value: (String(describing: value))))
        }
        print(urlComponents.url!,parameters)
        urlSession.dataTask(with: urlComponents.url!) { data, response, error in
            guard let data = data else {
                completion(Result.error(WeatherError.invalidData))
                return
            }
            do {
                let decoder = JSONDecoder()
                let jsonObj = try decoder.decode(T.self, from: data)
                completion(Result.success(jsonObj))
            } catch let error {
                completion(Result.error(error))
            }
        }.resume()
    }
}

//MARK: URLSessionProtocol.

public typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

public protocol URLSessionProtocol {
    func dataTask(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
    func dataTask(with request: URLRequest, completionHandler: @escaping DataTaskResult) -> URLSessionDataTask
}

extension URLSession: URLSessionProtocol { }
