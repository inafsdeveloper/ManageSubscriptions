//
//  DataController.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/31/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MetaData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Failed to load: \(error.localizedDescription)")
            }
        }
    }
}
