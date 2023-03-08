//
//  Clouds+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData


extension Clouds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Clouds> {
        return NSFetchRequest<Clouds>(entityName: "Clouds")
    }

    @NSManaged public var all: Int16

}
