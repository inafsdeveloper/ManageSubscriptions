//
//  VideoItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI
import WebKit
import AVKit

struct VideoItemView: View {
    // MARK: - PROPERTIES
    let video: YTSVidItem
    let image: String
    
    
    // MARK: - BODY
    var body: some View {
        let urlString = "https://www.youtube.com/embed/\(String(describing: video.id.videoId))"
        VStack(alignment: .center, spacing: 5) {
            
            YouTubeView(videoId: video.id.videoId!)
                .frame(height: 250)
            
            HStack(alignment: .center, spacing: 16) {
                Image(image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 2))
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(video.snippet.title)
                        .font(.subheadline)
                    Text(video.snippet.description)
                        .font(.caption)
                } //: VSTACK
                .padding()
            } //: HSTACK
            .padding()
            .frame(height: 50)
        } //: VSTACK
        .frame(height: 300)
        
        
    }
}

struct YouTubeView: UIViewRepresentable {
    let videoId: String
    func makeUIView(context: Context) ->  WKWebView {
        return WKWebView()
    }
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let demoURL = URL(string: "https://www.youtube.com/embed/\(videoId)") else { return }
        uiView.scrollView.isScrollEnabled = false
        uiView.load(URLRequest(url: demoURL))
    }
}

struct VideoItemView_Previews: PreviewProvider {
    static var allVideos: YTVideosSearch = Bundle.main.load("videos-api.json")
    static var video: YTSVidItem = allVideos.items[0]
    static var image: String = "3Blue1Brown"
    static var previews: some View {
        VideoItemView(video: video, image: image)
    }
}
