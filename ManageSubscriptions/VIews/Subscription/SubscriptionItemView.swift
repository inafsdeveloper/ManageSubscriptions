//
//  SubscriptionItemView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/27/23.
//

import SwiftUI

struct SubscriptionItemView: View {
    // MARK: - PROPERTIES
    let subscription: Subscription
    
    // MARK: - BODY
    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Image(subscription.image)
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.white, lineWidth: 4))
                .frame(width: 90, height: 90)
            Text(subscription.title)
                .font(.title2)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
        }
    }
}

struct SubscriptionItemView_Previews: PreviewProvider {
    static var categories: [CategoryModel] = Bundle.main.decode("categories.json")
    static var subscription: Subscription = categories[1].subscriptions![0]
    static var previews: some View {
        SubscriptionItemView(subscription: subscription)
    }
}
