//
//  DataController.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/31/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    static let shared = DataController()
    
    var initializeDb: Bool = false
    
    let container: NSPersistentContainer
    
    var categoryDummyData: [Category]
    
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "MetaData")
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Failed to load: \(error.localizedDescription)")
            }
        }
        
        categoryDummyData = []
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    
    static var preview: DataController = {
        let result = DataController(inMemory: true)
        
        let moc = result.container.viewContext
        
        if (result.initializeDb) {
            let categories: [CategoryModel] = Bundle.main.decode("categories.json")
            for category in categories {
                var cat = Category(context: moc)
                cat.id = UUID()
                cat.name = category.name
                cat.image = category.image
                cat.catDescription = category.description
                
                print(cat.name!)
                
                for subscription in category.subscriptions! {
                    var sub = Subscription(context: moc)
                    sub.id = UUID()
                    sub.channelId = subscription.channelId
                    sub.title = subscription.title
                    sub.image = subscription.image
                    sub.subDescription = subscription.description
                    sub.origin = cat
                    
                    print(sub.title!)
                }
                
                result.categoryDummyData.append(cat)
                try? moc.save()
            }
        }
        
//        let cat1 = Category(context: moc)
//        cat1.name = "Science"
//        cat1.image = "Category-Science"
//        cat1.catDescription = "Dummy Description"
//
//        let sub1 = Subscription(context: moc)
//        sub1.id = UUID()
//        sub1.channelId = "UC7_gcs09iThXybpVgjHZ_7g"
//        sub1.title =  "PBS Space Time"
//        sub1.image = "PBSSpaceTime"
//        sub1.subDescription =  "Dummy Description for category"
//        sub1.origin = cat1
//
//
//        let sub2 = Subscription(context: moc)
//        sub2.id = UUID()
//        sub2.channelId = "UCUHW94eEFW7hkUMVaZz4eDg"
//        sub2.title =  "Minute Physics"
//        sub2.image = "MinutePhysics"
//        sub2.subDescription =  "Dummy Description for category"
//        sub2.origin = cat1
//
//
//        let cat2 = Category(context: moc)
//        cat2.name = "Technology"
//        cat2.image = "Category-Technology"
//        cat2.catDescription = "Dummy Description"
//
//        let sub3 = Subscription(context: moc)
//        sub3.id = UUID()
//        sub3.channelId = "UCjtUS7-SZTi6pXjUbzGHQCg"
//        sub3.title =  "Undecided with Matt Ferrell"
//        sub3.image = "UMF"
//        sub3.subDescription =  "Dummy Description for category"
//        sub3.origin = cat2
//
//
//        let sub4 = Subscription(context: moc)
//        sub4.id = UUID()
//        sub4.channelId = "UC4QZ_LsYcvcq7qOsOhpAX4A"
//        sub4.title =  "ColdFusion"
//        sub4.image = "ColdFusion"
//        sub4.subDescription =  "Dummy Description for category"
//        sub4.origin = cat2
        
        try? moc.save()
        
        return result
    }()
    
    /*
    let container = NSPersistentContainer(name: "MetaData")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data Failed to load: \(error.localizedDescription)")
            }
        }
    }
     */
}
