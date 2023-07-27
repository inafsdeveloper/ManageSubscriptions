//
//  YTSubscriptions.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import Foundation

struct YTSubscriptions: Decodable, Hashable {
    var kind: String
    var etag: String
    var nextPageToken: String?
    var pageInfo: SubsPageInfo
    var items:[SubsItem]
}

struct SubsPageInfo: Decodable, Hashable {
    var totalResults: Int
    var resultsPerPage: Int
}

struct SubsItem: Decodable, Hashable {
    var kind: String
    var etag: String
    var id: String
    var snippet: SubsSnippet
}

struct SubsSnippet:Decodable, Hashable {
    var publishedAt: String
    var title: String
    var description: String
    var resourceId: SubsResourceId
    var channelId: String
    var thumbnails: SubsThumbnails?
}

struct SubsResourceId: Decodable, Hashable {
    var kind: String
    var channelId: String
}

struct SubsThumbnails: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case medium, high
        case defaultTN = "default"
    }
    
    var defaultTN: SubsThumbnailUrl?
    var medium: SubsThumbnailUrl?
    var high: SubsThumbnailUrl?
}
struct SubsThumbnailUrl: Decodable, Hashable {
        var url: String
}
