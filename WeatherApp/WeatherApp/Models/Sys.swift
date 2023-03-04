//
//  Sys.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation

public struct Sys: Codable {
    public let id: Int?
    public let type: Int?
    public let message: Double?
    public let country: String?
    public let sunrise: Int?
    public let sunset: Int?
}
