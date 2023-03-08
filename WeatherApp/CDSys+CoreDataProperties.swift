//
//  CDSys+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 8/3/2023.
//
//

import Foundation
import CoreData


extension CDSys {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDSys> {
        return NSFetchRequest<CDSys>(entityName: "CDSys")
    }

    @NSManaged public var country: String?
    @NSManaged public var id: Int16
    @NSManaged public var sunrise: Int16
    @NSManaged public var sunset: Int16
    @NSManaged public var type: Int16

}
