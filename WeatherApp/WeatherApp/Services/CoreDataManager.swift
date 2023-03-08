//
//  CoreDataManager.swift
//  WeatherApp
//
//  Created by Wajih Benabdessalem on 7/3/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        container = NSPersistentContainer(name: "WeatherApp")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        context = container.viewContext
    }

    func save() {
        do {
            try context.save()
        } catch let error {
            print("Error saving Core Data. \(error)")
        }
    }
}
