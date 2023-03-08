//
//  CDMain+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 8/3/2023.
//
//

import Foundation
import CoreData


extension CDMain {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDMain> {
        return NSFetchRequest<CDMain>(entityName: "CDMain")
    }

    @NSManaged public var feelsLike: Double
    @NSManaged public var humidity: Int16
    @NSManaged public var pressure: Double
    @NSManaged public var temp: Double
    @NSManaged public var tempMax: Double
    @NSManaged public var tempMin: Double

}
