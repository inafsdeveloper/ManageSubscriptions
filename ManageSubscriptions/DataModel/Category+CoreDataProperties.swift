//
//  Category+CoreDataProperties.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/31/23.
//
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var catDescription: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?
    @NSManaged public var id: UUID?
    @NSManaged public var subscription: Set<Subscription>
    
    public var wrappedCatDescription: String {
        catDescription ?? "UA"
    }

    
    public var wrappedImage: String {
        image ?? "UA"
    }
    
    public var wrappedName: String {
        name ?? "UA"
    }
    
    public var wrappedId: UUID {
        id ?? UUID()
    }
    
    public var subscriptionArray: [Subscription] {
        let set = subscription as? Set<Subscription> ?? []
        return set.sorted {
            $0.wrappedTitle < $1.wrappedTitle
        }
    }
}

// MARK: Generated accessors for subscription
extension Category {

    @objc(addSubscriptionObject:)
    @NSManaged public func addToSubscription(_ value: Subscription)

    @objc(removeSubscriptionObject:)
    @NSManaged public func removeFromSubscription(_ value: Subscription)

    @objc(addSubscription:)
    @NSManaged public func addToSubscription(_ values: NSSet)

    @objc(removeSubscription:)
    @NSManaged public func removeFromSubscription(_ values: NSSet)

}

extension Category : Identifiable {

}
