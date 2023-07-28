//
//  SubscriptionsView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

struct SubscriptionsView: View {
    // MARK: - PROPERTIES
    let category: CategoryModel?
    
    // MARK: - BODY
    var body: some View {
        if((category) != nil) {
            CatgegorySubscriptionView(category: category!)
        }
        else {
            // MARK: - need to add logic to handle when no categories are passed
            SubscriptionListView()
        }
    }
}

struct SubscriptionsView_Previews: PreviewProvider {
    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
    static var previews: some View {
        
        SubscriptionsView(category: categories[1])
    }
}
