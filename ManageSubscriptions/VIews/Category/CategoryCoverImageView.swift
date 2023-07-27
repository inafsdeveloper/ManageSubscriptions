//
//  CategoryCoverImageView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

struct CategoryCoverImageView: View {
    // MARK: - PROPERTIES
    let categories: [CategoryModel]
    var body: some View {
        TabView{
            ForEach(categories) { category in
                CategoryCoverItemView(category: category)
            }
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCoverImageView(categories: Bundle.main.decode("categories.json"))
    }
}
