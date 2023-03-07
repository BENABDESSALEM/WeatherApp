//
//  Weather+CoreDataClass.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData

@objc(Weather)
public class Weather: NSManagedObject,Codable {
    enum CodingKeys: String, CodingKey {
        case visibility = "visibility"
        case name  = "name"
        case id = "id"
        case dt = "dt"
        case base = "base"
        case timezone = "timezone"
        case cod = "cod"
    }
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Weather", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        do {
            visibility = try values.decodeIfPresent(Int16.self, forKey: .visibility)!
            name = try values.decodeIfPresent(String.self, forKey: .name)!
            id = try values.decodeIfPresent(Int16.self, forKey: .id)!
            dt = try values.decodeIfPresent(Int16.self, forKey: .dt)!
            base = try values.decodeIfPresent(String.self, forKey: .base)!
            timezone = try values.decodeIfPresent(Int16.self, forKey: .timezone)!
            cod = try values.decodeIfPresent(Int16.self, forKey: .cod)!
        } catch {
            print ("error")
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(visibility , forKey: .visibility)
            try container.encode(name , forKey: .name)
            try container.encode(id , forKey: .id)
            try container.encode(dt , forKey: .dt)
            try container.encode(base , forKey: .base)
            try container.encode(timezone , forKey: .timezone)
            try container.encode(cod , forKey: .cod)
        } catch {
            print("error")
        }
    }
}