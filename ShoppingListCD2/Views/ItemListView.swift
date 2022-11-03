//
//  ItemsView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 12/10/2022.
//

import SwiftUI

struct ItemListView: View {
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var moc
    @State private var showingAddItem = false
    
    let items: FetchRequest<Item>
    
    let showItemsToBuy: Bool
    let selectedFilter: String
    
    init(showItemsToBuy: Bool, selectedFilter: String) {
        self.showItemsToBuy = showItemsToBuy
        self.selectedFilter = selectedFilter
        
//        let toBuyPredicate = NSPredicate(format: "toBuy = %@", showItemsToBuy)
//        let itemLabelPredicate = NSPredicate(format: "label LIKE[c] %@", selectedFilter)
        
//        let compoundPredicate = NSCompoundPredicate(type: NSCompoundPredicate(type: .and, subpredicates: [toBuyPredicate, itemLabelPredicate]))
        // TODO: why doesn't this work?
        
        
        items = FetchRequest<Item>(entity: Item.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.createdAt, ascending: false)
        ], predicate: NSPredicate(format: "labelName LIKE[c] %@ AND toBuy = true", selectedFilter))
        //TODO: add ability to toggle toBuy and predicate here
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items.wrappedValue) { item in
                    ItemRowView(item: item)
                }
                //TODO: need to figure out the delete process here
                Button {
                    showingAddItem.toggle()
                } label: {
                    Text("Add new item")
                    //TODO: this doesn't actually seem to work. Why?
                }
            }
            .sheet(isPresented: $showingAddItem) {
                AddItemView()
            }
            .navigationTitle("The best motherfucking shopping list")
        }
        
        
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView(showItemsToBuy: true, selectedFilter: "Fruit & Veg")
    }
}
