//
//  CategoryCoverItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct CategoryCoverItemView: View {
    // MARK: - PROPERTIEES
    let category: Category
    // MARK: - BODY
    var body: some View {
        ZStack(alignment: .center) {
            if let imageURLString = category.image {
                if checkIfUrl(string: imageURLString) {
                    AsyncImage(url: URL(string: imageURLString)) { image in
                        image
                            .resizable()
                            .scaledToFill()
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(imageURLString)
                        .resizable()
                        .scaledToFill()
                }
            } else {
                Image(systemName: "photo.circle")
                    .resizable()
                    .scaledToFill()
            }

            Text(category.wrappedName)
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
    
    static var previews: some View {
        CategoryCoverItemView(category: DataController.preview.categoryDummyData[0])
    }
}
