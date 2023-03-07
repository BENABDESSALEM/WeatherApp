//
//  Main+CoreDataClass.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//
//

import Foundation
import CoreData

@objc(Main)
public class Main: NSManagedObject,Codable {
    enum CodingKeys: String, CodingKey {
        case tempMin = "tempMin"
        case tempMax  = "tempMax"
        case temp = "temp"
        case pressure = "pressure"
        case humidity = "humidity"
        case feelLike = "feelLike"
    }
    required convenience public init(from decoder: Decoder) throws {
        // return the context from the decoder userinfo dictionary
        guard let contextUserInfoKey = CodingUserInfoKey.context,
              let managedObjectContext = decoder.userInfo[contextUserInfoKey] as? NSManagedObjectContext,
              let entity = NSEntityDescription.entity(forEntityName: "Main", in: managedObjectContext)
        else {
            fatalError("decode failure")
        }
        
        self.init(entity: entity, insertInto: managedObjectContext)
        
        let values = try decoder.container(keyedBy: CodingKeys.self)
        
        do {
            tempMin = try values.decodeIfPresent(Double.self, forKey: .tempMin)!
            tempMax = try values.decodeIfPresent(Double.self, forKey: .tempMax)!
            temp = try values.decodeIfPresent(Double.self, forKey: .temp)!
            pressure = try values.decodeIfPresent(Double.self, forKey: .pressure)!
            humidity = try values.decodeIfPresent(Int16.self, forKey: .humidity)!
            feelLike = try values.decodeIfPresent(Double.self, forKey: .feelLike)!
        } catch {
            print ("error")
        }
    }
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        do {
            try container.encode(tempMin , forKey: .tempMin)
            try container.encode(tempMax , forKey: .tempMax)
            try container.encode(temp , forKey: .temp)
            try container.encode(pressure , forKey: .pressure)
            try container.encode(humidity , forKey: .humidity)
            try container.encode(feelLike , forKey: .feelLike)
        } catch {
            print("error")
        }
    }
}
