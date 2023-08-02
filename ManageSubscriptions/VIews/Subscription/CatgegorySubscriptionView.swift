//
//  CatgegorySubscriptionView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct CatgegorySubscriptionView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var moc
    @StateObject var category: Category
    
    @State private var showAddSubsScreen = false
    
    // MARK: - FUNCTIONS
    func deleteSubscriptionsFromCategory(at offsets: IndexSet) {
        for offset in offsets {
            let index = category.subscription.firstIndex { sub in
                sub.id == category.subscriptionArray[offset].id
            }
            
            category.subscription.remove(at: index!)
            
            try? moc.save()
        }
    }
    
    // MARK: - BODY
    var body: some View {
        VStack(alignment: .center) {
            CategoryCoverItemView(category: category)
                .frame(width: 300, height: 200)
            
            List {
                ForEach(category.subscriptionArray) {subs in
                    NavigationLink {
                        VideoListItemView(channelId: subs.channelId)
                    } label: {
                        SubscriptionItemView(subscription: subs)
                    }
                }
                .onDelete(perform: deleteSubscriptionsFromCategory)
            } //: LIST
        } //: VSTACK
        .toolbar {
            ToolbarItem (placement: .navigationBarTrailing) {
                Button {
                    showAddSubsScreen = true
                } label: {
                    Label("Add Subs", systemImage: "plus")
                }
            }
        }
        .sheet(isPresented: $showAddSubsScreen) {
            let loadedData: YTSubscriptions = Bundle.main.load("subscription-api.json")
            let subsToBeFiltered = Set(category.subscriptionArray.map {$0.wrappedChannelId})
            let filterSubs: [SubsItem] = loadedData.items.filter { !subsToBeFiltered.contains($0.snippet.resourceId.channelId)}
            let selectedSubs: [SelectedSubs] = filterSubs.map {item in
                return SelectedSubs(subscription: item)
            }
            AddSubsToCategory(category: category, allSubscription: selectedSubs)
        }
        
    }
}

//struct CatgegorySubscriptionView_Previews: PreviewProvider {
//    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
//    static var previews: some View {
//        CatgegorySubscriptionView(category: categories[1])
//    }
//}
