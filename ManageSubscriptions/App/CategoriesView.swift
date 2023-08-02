//
//  CategoriesView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

struct CategoriesView: View {
    // MARK: - PROPERTIES
    @FetchRequest(sortDescriptors: []) var categories: FetchedResults<Category>
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                List {
                    CategoryCoverImageView(categories: categories)
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    ForEach(categories) { category in
                        NavigationLink {
                            SubscriptionsView(category: category)
                        } label: {
                            CategoryItemView(category: category)
                        }
                    }
                } //: LIST
            } //: VSTACK
            .navigationBarTitle("Categories", displayMode: .large)
        } //: NAVIGATION
        
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
