//
//  CategoryItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

struct CategoryItemView: View {
    // MARK: - PROPERTIES
    let category: Category
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            if let imageURLString = category.image {
                if checkIfUrl(string: imageURLString) {
                    AsyncImage(url: URL(string: imageURLString)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: 90, height: 90)
                            .clipShape(RoundedRectangle(cornerRadius: 12))
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(imageURLString)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                }
            } else {
                Image(systemName: "photo.circle")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(RoundedRectangle(cornerRadius: 12))
            }
            
            Text(category.wrappedName)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
        }//: HSTACK
    }
}

//struct CategoryItemView_Previews: PreviewProvider {
//    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
//    static var previews: some View {
//        CategoryItemView(category: categories[0])
//    }
//}
