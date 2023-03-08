//
//  Weather+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData


extension Weather {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Weather> {
        return NSFetchRequest<Weather>(entityName: "Weather")
    }

    @NSManaged public var base: String?
    @NSManaged public var dt: Int16
    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var visibility: Int16
    @NSManaged public var timezone: Int16
    @NSManaged public var cod: Int16
    @NSManaged public var clouds: Clouds?
    @NSManaged public var coord: Coord?
    @NSManaged public var main: Main?
    @NSManaged public var sys: Sys?
    @NSManaged public var weather: Set<WeatherDetails>?
    @NSManaged public var wind: Wind?

    public var weathers: [WeatherDetails]{
        let setOfWeather = weather
        return setOfWeather!.sorted{
            $0.id > $1.id
        }
    }
}

// MARK: Generated accessors for weather
extension Weather {

    @objc(addWeatherObject:)
    @NSManaged public func addToWeather(_ value: WeatherDetails)

    @objc(removeWeatherObject:)
    @NSManaged public func removeFromWeather(_ value: WeatherDetails)

    @objc(addWeather:)
    @NSManaged public func addToWeather(_ values: NSSet)

    @objc(removeWeather:)
    @NSManaged public func removeFromWeather(_ values: NSSet)

}
