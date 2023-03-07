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
    @NSManaged public var identifier: Int16
    @NSManaged public var name: String?
    @NSManaged public var visibility: Int16
    @NSManaged public var clouds: Clouds?
    @NSManaged public var coord: Location?
    @NSManaged public var main: Main?
    @NSManaged public var sys: Sys?
    @NSManaged public var weather: WeatherDetails?
    @NSManaged public var wind: Wind?

}
