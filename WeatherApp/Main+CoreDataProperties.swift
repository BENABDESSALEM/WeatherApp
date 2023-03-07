//
//  Main+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData


extension Main {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Main> {
        return NSFetchRequest<Main>(entityName: "Main")
    }

    @NSManaged public var humidity: Int16
    @NSManaged public var pressure: Double
    @NSManaged public var temp: Double
    @NSManaged public var tempMax: Double
    @NSManaged public var tempMin: Double
    @NSManaged public var feelsLike: Double

}
