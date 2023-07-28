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

            WebView(urlString: urlString)
                
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

struct WebView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
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
