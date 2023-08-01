//
//  SubscriptionItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct SubscriptionItemView: View {
    // MARK: - PROPERTIES
    let subscription: CatSubscription
    
    // MARK: - FUNCTIONS
    func checkIfUrl(string: String) -> Bool {
        return string.contains("http")
    }
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            
            if let imageURLString = subscription.image {
                if checkIfUrl(string: imageURLString) {
                    AsyncImage(url: URL(string: imageURLString)) { image in
                        image.resizable()
                            .clipShape(Circle())
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .frame(width: 90, height: 90)
                    } placeholder: {
                        ProgressView()
                    }
                } else {
                    Image(imageURLString)
                        .resizable()
                        .scaledToFit()
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.white, lineWidth: 4))
                        .frame(width: 90, height: 90)
                }
                
            } else {
                Image(systemName: "photo.circle")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white, lineWidth: 4))
                    .frame(width: 90, height: 90)
            }
            
            Text(subscription.title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
        }
    }
}

struct SubscriptionItemView_Previews: PreviewProvider {
    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
    static var subscription: CatSubscription = categories[1].subscriptions![0]
    static var previews: some View {
        SubscriptionItemView(subscription: subscription)
    }
}
