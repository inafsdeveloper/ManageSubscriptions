//
//  Subscription+CoreDataProperties.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/31/23.
//
//

import Foundation
import CoreData


extension Subscription {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Subscription> {
        return NSFetchRequest<Subscription>(entityName: "Subscription")
    }

    @NSManaged public var subDescription: String?
    @NSManaged public var image: String?
    @NSManaged public var title: String?
    @NSManaged public var channelId: String?
    @NSManaged public var id: UUID?
    @NSManaged public var origin: Category?
    
    public var wrappedSubDescription: String {
        subDescription ?? "UA"
    }
    
    public var wrappedImage: String {
        image ?? "UA"
    }
    
    public var wrappedTitle: String {
        title ?? "UA"
    }
    
    public var wrappedChannelId: String {
        channelId ?? "UA"
    }
    
    public var wrappedId: UUID {
        id ?? UUID()
    }

    
}

extension Subscription : Identifiable {

}
