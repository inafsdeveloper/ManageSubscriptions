//
//  CategoryContentView.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 8/1/23.
//

import SwiftUI

struct CategoryContentView: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var categories: FetchedResults<Category>
    @FetchRequest(sortDescriptors: []) var subscriptions: FetchedResults<Subscription>
    let categoriesData: [CategoryModel] = Bundle.main.decode("categories.json")
    
    // MARK: - FUNCTIONS
    func deleteCategories(at offsets: IndexSet) {
        for offset in offsets {
            // find this book in our fetch request
            let category = categories[offset]
            
            // delete it from the context
            moc.delete(category)
        }
        
        do {
            try moc.save()
        } catch {
            let nsError = error as NSError
            print("Unresolved error while saving: \(nsError.localizedDescription)")
        }
    }
    
    
    func deleteSubscription(at offsets: IndexSet , from category: Category) {
        print("Delete Subscription...")
        
        print(offsets)
        
        for offset in offsets {
            // find this book in our fetch request
//            let subscription = subscriptions[offset]
            print(offset)
            
            let index = category.subscription.firstIndex { sub in
                sub.id == category.subscriptionArray[offset].id
            }
            categories.first { cat in
                cat.id == category.id
            }?.subscription.remove(at: index!)
            
            try? moc.save()
        }
    }
    
    func addData() {
        let categoriesJ: [CategoryModel] = Bundle.main.decode("categories.json")
        for category in categoriesJ {
            let cat = Category(context: moc)
            cat.id = UUID()
            cat.name = category.name
            cat.image = category.image
            cat.catDescription = category.description
            
            print(cat.name!)
            
            for subscription in category.subscriptions! {
                let sub = Subscription(context: moc)
                sub.id = UUID()
                sub.channelId = subscription.channelId
                sub.title = subscription.title
                sub.image = subscription.image
                sub.subDescription = subscription.description
                sub.origin = cat
                
                print(sub.title!)
            }
            
            try? moc.save()
        }
    }
        
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(categories, id:\.self) { category in
                        Section(category.wrappedName) {
                            ForEach(category.subscriptionArray, id:\.self) { subscription in
                                Text(subscription.wrappedTitle)
                            }
                            .onDelete { indices in
                                self.deleteSubscription(at: indices, from: category)
                            }
                        }
                    }
                    .onDelete(perform: deleteCategories)
                }
                
                
                
                Button("Add") {
                    addData()
                    /*
                    let cat1 = Category(context: moc)
                    cat1.name = "Science"
                    cat1.image = "Category-Science"
                    cat1.catDescription = "Dummy Description"
                    
                    let sub1 = Subscription(context: moc)
                    sub1.id = UUID()
                    sub1.channelId = "UC7_gcs09iThXybpVgjHZ_7g"
                    sub1.title =  "PBS Space Time"
                    sub1.image = "PBSSpaceTime"
                    sub1.subDescription =  "Dummy Description for category"
                    sub1.origin = cat1
                    
                    
                    let sub2 = Subscription(context: moc)
                    sub2.id = UUID()
                    sub2.channelId = "UCUHW94eEFW7hkUMVaZz4eDg"
                    sub2.title =  "Minute Physics"
                    sub2.image = "MinutePhysics"
                    sub2.subDescription =  "Dummy Description for category"
                    sub2.origin = cat1
                    
                    
                    let cat2 = Category(context: moc)
                    cat2.name = "Technology"
                    cat2.image = "Category-Technology"
                    cat2.catDescription = "Dummy Description"
                    
                    let sub3 = Subscription(context: moc)
                    sub3.id = UUID()
                    sub3.channelId = "UCjtUS7-SZTi6pXjUbzGHQCg"
                    sub3.title =  "Undecided with Matt Ferrell"
                    sub3.image = "UMF"
                    sub3.subDescription =  "Dummy Description for category"
                    sub3.origin = cat2
                    
                    
                    let sub4 = Subscription(context: moc)
                    sub4.id = UUID()
                    sub4.channelId = "UC4QZ_LsYcvcq7qOsOhpAX4A"
                    sub4.title =  "ColdFusion"
                    sub4.image = "ColdFusion"
                    sub4.subDescription =  "Dummy Description for category"
                    sub4.origin = cat2
                    
                    try? moc.save()
                    */
                }
            }
            .navigationTitle("Categories")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
    }
}

struct CategoryContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        CategoryContentView()
            .environment(\.managedObjectContext, DataController.preview.container.viewContext)
    }
}
