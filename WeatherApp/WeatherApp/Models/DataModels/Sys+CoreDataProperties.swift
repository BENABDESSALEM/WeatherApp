//
//  Sys+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData


extension Sys {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Sys> {
        return NSFetchRequest<Sys>(entityName: "Sys")
    }

    @NSManaged public var country: String?
    @NSManaged public var id: Int16
    @NSManaged public var sunrise: Int16
    @NSManaged public var sunset: Int16
    @NSManaged public var type: Int16

}
