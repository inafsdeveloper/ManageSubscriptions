//
//  VideoItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI
import AVKit

struct VideoItemView: View {
    // MARK: - PROPERTIES
    let video: YTSVidItem
    
    
    // MARK: - BODY
    var body: some View {
        let videoURL: URL = URL(string: "https://www.youtube.com/embed/\(String(describing: video.id.videoId!))")!
        VStack {
            VideoPlayer(player: AVPlayer(url: videoURL))
                .frame(height: 300)
                .aspectRatio(16/9, contentMode: .fit)
                .cornerRadius(16)
            
            HStack {
                Text(video.snippet.title)
            }
        } //: VSTACK
    }
}

struct VideoItemView_Previews: PreviewProvider {
static var allVideos: YTVideosSearch = Bundle.main.load("videos-api.json")
    static var video: YTSVidItem = allVideos.items[0]
    
    static var previews: some View {
        VideoItemView(video: video)
    }
}
