//
//  CDClouds+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 8/3/2023.
//
//

import Foundation
import CoreData


extension CDClouds {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDClouds> {
        return NSFetchRequest<CDClouds>(entityName: "CDClouds")
    }

    @NSManaged public var all: Int16

}
