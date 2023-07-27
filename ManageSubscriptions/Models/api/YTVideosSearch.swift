//
//  YTVideosSearch.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import Foundation

struct YTVideosSearch: Decodable, Hashable {
    var kind: String
    var etag: String
    var prevPageToken: String?
    var nextPageToken: String?
    var regionCode: String
    var pageInfo: YTSVidPageInfo
    var items: [YTSVidItem]
}

struct YTSVidPageInfo: Decodable, Hashable {
    var totalResults: Int
    var resultsPerPage: Int
}

struct YTSVidItem: Decodable, Hashable {
    var kind: String
    var etag: String
    var id: YTSVidItemId
    var snippet: YTSVidSnippet
}

struct YTSVidItemId: Decodable, Hashable {
    var kind: String
    var videoId: String?
}

struct YTSVidSnippet: Decodable, Hashable {
    var publishedAt: String
    var channelId: String
    var title: String
    var description: String
    var thumbnails: YTSVidThumbnail
    var channelTitle: String
    var liveBroadcastContent: String
    var publishTime: String
}

struct YTSVidThumbnail: Decodable, Hashable {
    enum CodingKeys: String, CodingKey {
        case medium, high
        case defaultT = "default"
    }
    
    var defaultT: YTSVidThumbnailURL
    
    var medium: YTSVidThumbnailURL
    
    var high: YTSVidThumbnailURL
}

struct YTSVidThumbnailURL: Decodable, Hashable {
    var url: String
}
