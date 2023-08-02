//
//  ManageSubscriptionsApp.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/26/23.
//

import SwiftUI

@main
struct ManageSubscriptionsApp: App {
    let dataController = DataController.shared
    
    var body: some Scene {
        WindowGroup {
            MainView()
//            CategoryContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
