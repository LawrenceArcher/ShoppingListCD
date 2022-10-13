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
    
    let items: FetchRequest<Item>
    
    let showItemsToBuy = true //TODO: need to allow this to change to see "archive" - top left toolbar?
    
    init() {
        items = FetchRequest<Item>(entity: Item.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \Item.createdAt, ascending: false)
        ], predicate: NSPredicate(format: "toBuy = %d", showItemsToBuy))
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(items.wrappedValue) { item in
                    ItemRowView(item: item)
                }
                //TODO: need to figure out the delete process here
                Button {
                    withAnimation {
                        let item = Item(context: moc)
                        item.createdAt = Date()
                        dataController.save()
                    }
                } label: {
                    Text("Add new item")
                    //TODO: this doesn't actually seem to work. Why?
                }
            }
        }
    }
}

struct ItemListView_Previews: PreviewProvider {
    static var previews: some View {
        ItemListView()
    }
}
