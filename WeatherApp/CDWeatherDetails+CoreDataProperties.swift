//
//  CDWeatherDetails+CoreDataProperties.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 8/3/2023.
//
//

import Foundation
import CoreData


extension CDWeatherDetails {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CDWeatherDetails> {
        return NSFetchRequest<CDWeatherDetails>(entityName: "CDWeatherDetails")
    }

    @NSManaged public var desc: String?
    @NSManaged public var icon: String?
    @NSManaged public var id: Int16
    @NSManaged public var main: String?

}
