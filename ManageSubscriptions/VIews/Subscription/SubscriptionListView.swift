//
//  SubscriptionListView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct SubscriptionListView: View {
    // MARK: - PROPERTIES
    @State private var searchText: String = ""
    
    private var allSubscriptions: YTSubscriptions = Bundle.main.load("subscription-api.json")
    
    private var filteredItems: [SubsItem] {
        if (searchText.isEmpty) {
            return allSubscriptions.items
        } else {
            return allSubscriptions.items.filter {$0.snippet.title.contains(searchText)}
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                List {
                    ForEach(filteredItems, id:\.self) { item in
                        
                        HStack(alignment: .center) {
                            if let imageURL = item.snippet.thumbnails?.medium?.url
                            {
                                AsyncImage(url: URL(string: imageURL)) { image in
                                    image.resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                        .frame(width: 40, height: 40)
                                } placeholder: {
                                    ProgressView()
                                }
                            } else {
                                Image(systemName: "photo.circle")
                            }
                            
                            Text(item.snippet.title)
                                .padding(.leading)
                            
                            
                        } //: HSTACK
                        
                    }
                } //: LIST
                
            } //: VSTACK
            .navigationTitle("Subscriptions")
        }

    }
}

struct SubscriptionListView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionListView()
    }
}
