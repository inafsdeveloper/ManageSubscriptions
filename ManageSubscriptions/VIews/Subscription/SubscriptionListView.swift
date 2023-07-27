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
    
    private var filteredItem: [SubsItem] {
        if (searchText.isEmpty) {
            return allSubscriptions.items
        } else {
            
            return allSubscriptions.items.filter {$0.snippet.title.contains(searchText)}
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack {
            TextField("Search", text: $searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
            List {
                ForEach(filteredItem, id:\.self) { item in
                    Text(item.snippet.title)
                }
            } //: LIST
            
        } //: VSTACK
    }
}

struct SubscriptionListView_Previews: PreviewProvider {
    static var previews: some View {
        SubscriptionListView()
    }
}
