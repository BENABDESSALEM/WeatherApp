//
//  Sys+CoreDataClass.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData

@objc(Sys)
public class Sys: NSManagedObject,Codable {
    enum CodingKeys: String, CodingKey {
        case type = "type"
        case sunset = "sunset"
        case sunrise = "sunrise"
        case id = "id"
        case country = "country"
    }
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Sys", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            type = try values.decodeIfPresent(Int16.self, forKey: .type)!
            sunset = try values.decodeIfPresent(Int16.self, forKey: .sunset)!
            sunrise = try values.decodeIfPresent(Int16.self, forKey: .sunrise)!
            id = try values.decodeIfPresent(Int16.self, forKey: .id)!
            country = try values.decodeIfPresent(String.self, forKey: .country)!
        } catch {
            print ("error")
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(type , forKey: .type)
            try container.encode(sunset , forKey: .sunset)
            try container.encode(sunrise , forKey: .sunrise)
            try container.encode(id , forKey: .id)
            try container.encode(country , forKey: .country)
        } catch {
            print("error")
        }
    }
}
