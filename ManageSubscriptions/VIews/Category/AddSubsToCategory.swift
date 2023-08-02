//
//  AddSubsToCategory.swift
//  ManageSubscriptions
//
//  Created by Pankaj Nafria on 7/28/23.
//

import SwiftUI

struct SelectedSubs: Identifiable {
    let id: UUID = UUID()
    var subscription: SubsItem
    var isSelected: Bool = false
}
struct AddSubsToCategory: View {
    // MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    var category: Category
    
    @State private var searchText: String = ""
    
    @State var allSubscription: [SelectedSubs]
    
    private var filteredItems: [SelectedSubs] {
        if(searchText.isEmpty) {
            return allSubscription
        } else {
            return allSubscription.filter {$0.subscription.snippet.title.contains(searchText)}
        }
    }
    
    // MARK: - FUNCTIONS
    private func toggleSubsItem( item: SelectedSubs) {
        print("\(item.id)  : \(item.subscription.snippet.title) to be toggled")
        
        
        if let index = allSubscription.firstIndex(where: {$0.id == item.id}) {
            allSubscription[index].isSelected.toggle()
        }
    }
    
    // MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                TextField("Search", text: $searchText)
                    .padding()
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List {
                    ForEach(filteredItems) { item in
                        HStack(alignment: .center){
                            if let imageURL = item.subscription.snippet.thumbnails?.medium?.url {
                                AsyncImage(url: URL(string: imageURL)) { image in
                                    image.resizable()
                                        .clipShape(Circle())
                                        .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                        .frame(width: 40, height: 40)
                                } placeholder: {
                                    ProgressView()
                                }
                            } //: Async IMAGE
                            
                            Text(item.subscription.snippet.title)
                                .font(.title2)
                                .padding(.leading)
                            
                            Spacer()
                            
                            Image(systemName: item.isSelected ? "checkmark.square" : "square")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(item.isSelected ? .blue : .gray)
                                .onTapGesture {
                                    haptics.impactOccurred()
                                    toggleSubsItem(item: item)
                                }
                            
                        } //HSTACK
                    }
                } //: LIST
            } //: VSTACK
            .navigationBarTitle("Add/Delete Subs")
        } //: NAVIGATION
        .toolbar {
            ToolbarItem (placement: .navigationBarTrailing) {
                Button {
                    print("Done")
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("Done")
                }
                
            }
        }
        
    } //: BODY
}

//struct AddSubsToCategory_Previews: PreviewProvider {
//    static var categories: [CategoryModel] = Bundle.main.load("categories.json")
//    static var loadedData: YTSubscriptions = Bundle.main.load("subscription-api.json")
//    static var selectedSubs: [SelectedSubs] = loadedData.items.map {item in
//        return SelectedSubs(subscription: item)
//    }
//    static var previews: some View {
//        AddSubsToCategory(category: categories[0], allSubscription: selectedSubs)
//    }
//}
