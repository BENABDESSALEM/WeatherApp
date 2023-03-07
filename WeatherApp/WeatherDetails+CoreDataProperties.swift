//
//  WeatherDetails+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData


extension WeatherDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<WeatherDetails> {
        return NSFetchRequest<WeatherDetails>(entityName: "WeatherDetails")
    }

    @NSManaged public var desc: String?
    @NSManaged public var icon: String?
    @NSManaged public var identifier: Int16
    @NSManaged public var main: String?

}
