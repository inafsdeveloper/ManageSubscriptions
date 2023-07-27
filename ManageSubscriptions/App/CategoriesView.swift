//
//  CategoriesView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

struct CategoriesView: View {
    // MARK: - PROPERTIES
    let categories: [CategoryModel] = Bundle.main.decode("categories.json")
    // MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                List {
                    CategoryCoverImageView(categories: categories)
                        .frame(height: 300)
                        .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                    
                    ForEach(categories) { category in
                        NavigationLink {
                            SubscriptionsView()
                        } label: {
                            CategoryItemView(category: category)
                        }

                    }

                } //: LIST
            } //: GROUP
            .navigationBarTitle("Categories", displayMode: .large)
        } //: NAVIGATION
        
        
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
