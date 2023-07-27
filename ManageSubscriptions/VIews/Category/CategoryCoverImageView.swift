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
        }//: TAB
        .tabViewStyle(PageTabViewStyle())
    }
}

struct CoverImageView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryCoverImageView(categories: Bundle.main.decode("categories.json"))
    }
}
