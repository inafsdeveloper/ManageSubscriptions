//
//  VideoListItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    
    private var allVideos: YTVideosSearch = Bundle.main.load("videos-api.json")
    
    private var filteredItems: [YTSVidItem] {
        if (searchText.isEmpty) {
            return allVideos.items
        } else {
            return allVideos.items.filter {$0.snippet.title.contains(searchText)}
        }
    }
    // MARK: - BODY
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            List {
                ForEach(filteredItems, id:\.self) { item in
                    VideoItemView(video: item)
                }
            }
        }
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItemView()
    }
}
