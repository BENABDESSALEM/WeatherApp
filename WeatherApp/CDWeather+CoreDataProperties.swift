//
//  CDWeather+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 8/3/2023.
//
//

import Foundation
import CoreData


extension CDWeather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeather> {
        return NSFetchRequest<CDWeather>(entityName: "CDWeather")
    }

    @NSManaged public var base: String?
    @NSManaged public var cod: Int16
    @NSManaged public var dt: Int16
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var timezone: Int16
    @NSManaged public var visibility: Int16
    @NSManaged public var clouds: CDClouds?
    @NSManaged public var coord: CDCoord?
    @NSManaged public var main: CDMain?
    @NSManaged public var sys: CDSys?
    @NSManaged public var weather: Set<CDWeatherDetails>?
    @NSManaged public var wind: CDWind?

}

// MARK: Generated accessors for weather
extension CDWeather {

    @objc(addWeatherObject:)
    @NSManaged public func addToWeather(_ value: CDWeatherDetails)

    @objc(removeWeatherObject:)
    @NSManaged public func removeFromWeather(_ value: CDWeatherDetails)

    @objc(addWeather:)
    @NSManaged public func addToWeather(_ values: NSSet)

    @objc(removeWeather:)
    @NSManaged public func removeFromWeather(_ values: NSSet)

}
