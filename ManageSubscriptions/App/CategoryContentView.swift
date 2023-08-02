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
    
    func clearAll() {
        for category in categories {
            do {
                try moc.delete(category)
            }catch {
                let nsError = error as NSError
                print("Error while deleting all: \(nsError.localizedDescription)")
            }
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Button("Clear") {
                        clearAll()
                    }
                    Spacer()
                    Button("Add") {
                        addData()
                    }
                }
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
