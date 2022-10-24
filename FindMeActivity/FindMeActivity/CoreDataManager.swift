//
//  CoreDataManager.swift
//  FindMeActivity
//
//  Created by Hiramani Jain on 10/23/22.
//

import Foundation
import CoreData

class CoreDataManager{
    let persistentContainer: NSPersistentContainer
    static let shared:CoreDataManager = CoreDataManager()
    
    private init(){
        persistentContainer = NSPersistentContainer(name: "Activity")
        persistentContainer.loadPersistentStores{description, error in
            if let error = error {
                fatalError("Unable to initialize core Data \(error)")
                
            }
        }
    }
}
