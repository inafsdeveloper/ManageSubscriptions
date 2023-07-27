//
//  CategoryCoverItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct CategoryCoverItemView: View {
    // MARK: - PROPERTIEES
    let category: CategoryModel
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .center) {
            Image(category.image)
                .resizable()
                .scaledToFill()
            Text(category.name)
                .fontWeight(.black)
                .font(.system(size: 52))
                .foregroundColor(.accentColor)
                .padding(.leading)
                .padding(.trailing)
//                    .foregroundStyle(
//                        LinearGradient(
//                            colors: [.customGrayLight,
//                                .customGrayMedium],
//                            startPoint: .top,
//                            endPoint: .bottom)
//                    )
        }//: ZSTACK
    }
}

struct CategoryCoverItemView_Previews: PreviewProvider {
    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
    static var previews: some View {
        CategoryCoverItemView(category: categories[0])
    }
}
