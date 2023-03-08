//
//  CDWind+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 8/3/2023.
//
//

import Foundation
import CoreData


extension CDWind {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWind> {
        return NSFetchRequest<CDWind>(entityName: "CDWind")
    }

    @NSManaged public var deg: Double
    @NSManaged public var speed: Double

}
