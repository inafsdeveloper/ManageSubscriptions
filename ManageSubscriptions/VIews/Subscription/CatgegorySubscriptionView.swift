//
//  CatgegorySubscriptionView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct CatgegorySubscriptionView: View {
    // MARK: - PROPERTIES
    let category: CategoryModel
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                CategoryCoverItemView(category: category)
                    .frame(width: 300, height: 200)
                
                List {
                    ForEach(category.subscriptions!) {subs in
                        NavigationLink {
                            VideoListItemView(channelId: subs.channelId)
                        } label: {
                            SubscriptionItemView(subscription: subs)
                        }

                    }
                } //: LIST
            } //: VSTACK   
        }//: NAVIGATION
        .toolbar {
            ToolbarItem (placement: .navigationBarTrailing) {
                NavigationLink {
                    let loadedData: YTSubscriptions = Bundle.main.load("subscription-api.json")
                    let selectedSubs: [SelectedSubs] = loadedData.items.map {item in
                        return SelectedSubs(subscription: item)
                    }
                    AddSubsToCategory(category: category, allSubscription: selectedSubs)
                } label: {
                    Text("+")
                        .foregroundColor(.accentColor)
                        .font(.title)
                        .fontWeight(.heavy)
                }


            }
        }

    }
}

struct CatgegorySubscriptionView_Previews: PreviewProvider {
    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
    static var previews: some View {
        CatgegorySubscriptionView(category: categories[1])
    }
}
