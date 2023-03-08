//
//  CDCoord+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 8/3/2023.
//
//

import Foundation
import CoreData


extension CDCoord {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDCoord> {
        return NSFetchRequest<CDCoord>(entityName: "CDCoord")
    }

    @NSManaged public var lat: Double
    @NSManaged public var lon: Double

}
