//
//  Wind+CoreDataClass.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData

@objc(Wind)
public class Wind: NSManagedObject,Codable {
    enum CodingKeys: String, CodingKey {
        case speed = "speed"
        case deg = "deg"
    }
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Wind", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            speed = try values.decodeIfPresent(Double.self, forKey: .speed)!
            deg = try values.decodeIfPresent(Double.self, forKey: .deg)!
        } catch {
            print ("error")
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(speed , forKey: .speed)
            try container.encode(deg , forKey: .deg)
        } catch {
            print("error")
        }
    }
}
