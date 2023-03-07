//
//  WeatherDetails+CoreDataClass.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData

@objc(WeatherDetails)
public class WeatherDetails: NSManagedObject,Codable {
    enum CodingKeys: String, CodingKey {
        case main = "main"
        case identifier = "id"
        case icon = "icon"
        case desc = "description"
        
    }
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "WeatherDetails", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            main = try values.decodeIfPresent(String.self, forKey: .main)!
            identifier = try values.decodeIfPresent(Int16.self, forKey: .identifier)!
            icon = try values.decodeIfPresent(String.self, forKey: .icon)!
            desc = try values.decodeIfPresent(String.self, forKey: .desc)!
        } catch {
            print ("error")
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(main , forKey: .main)
            try container.encode(identifier , forKey: .identifier)
            try container.encode(icon , forKey: .icon)
            try container.encode(desc , forKey: .desc)
        } catch {
            print("error")
        }
    }
}
