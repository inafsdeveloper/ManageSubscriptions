//
//  CategoryItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTIES
    let category: CategoryModel
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(category.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90, height: 90)
                .clipShape(RoundedRectangle(cornerRadius: 12))
            Text(category.name)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
        }//: HSTACK
    }
}

struct CategoryItemView_Previews: PreviewProvider {
    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
    static var previews: some View {
        CategoryItemView(category: categories[0])
    }
}
