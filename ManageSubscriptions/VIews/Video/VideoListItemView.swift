//
//  VideoListItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct VideoListItemView: View {
    // MARK: - PROPERTIES
    let channelId: String?
    
    @State private var searchText: String = ""
    
    private var allVideos: YTVideosSearch
    
    init(channelId: String?) {
        self.channelId = channelId
        allVideos = Bundle.main.load("videos-api.json")
    }
    
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
                    VideoItemView(video: item, image: "3Blue1Brown")
                } //: LIST
                .padding(.bottom, 5)
                .listStyle(PlainListStyle())
                .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        } //: VSTACK
    }
}

struct VideoListItemView_Previews: PreviewProvider {
    static var previews: some View {
        VideoListItemView(channelId: nil)
    }
}
