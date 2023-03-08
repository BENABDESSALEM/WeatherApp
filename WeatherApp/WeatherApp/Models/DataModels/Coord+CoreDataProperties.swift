//
//  Coord+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData


extension Coord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Coord> {
        return NSFetchRequest<Coord>(entityName: "Coord")
    }

    @NSManaged public var lat: Double
    @NSManaged public var lon: Double

}
