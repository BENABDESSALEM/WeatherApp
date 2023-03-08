//
//  Main.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation

public struct Main: Codable {
    public let temp: Double?
    public let pressure: Double?
    public let humidity: Int?
    public let tempMin: Double?
    public let tempMax: Double?
    public let feelLike: Double?

    enum CodingKeys: String, CodingKey {
        case temp
        case feelLike = "feels_like"
        case pressure
        case humidity
        case tempMin = "temp_min"
        case tempMax = "temp_max"
    }
}
