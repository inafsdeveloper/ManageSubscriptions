//
//  MainView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

struct MainView: View {
    // MARK: - PROPERTIES
    
    // MARK: - BODY
    var body: some View {
        TabView {
            CategoriesView()
                .tabItem {
                    Image(systemName: "square.grid.2x2")
                    Text("Categories")
                }
            
            VideosView()
                .tabItem {
                    Image(systemName: "play.rectangle")
                    Text("Videos")
                }
            SubscriptionsView(category: nil)
                .tabItem {
                    Image(systemName: "music.note.list")
                    Text("Subscriptions")
                }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
