//
//  WeatherDetails.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 4/3/2023.
//

import Foundation

public struct WeatherDetails: Codable {
    public let id: Int?
    public let main: String?
    public let description: String?
    public let icon: String?
}
