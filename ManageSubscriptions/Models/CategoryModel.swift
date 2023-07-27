//
//  CategoryModel.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import Foundation

struct CategoryModel: Codable, Identifiable {
    var id: Int
    var name: String
    var image: String
//    var description: String
//    var subscriptions: [Subscription]
}

//struct Subscription: Codable, Identifiable {
//    var id: Int
//    var channelId: String
//    var title: String
//    var image: String
//    var description: String
//}
