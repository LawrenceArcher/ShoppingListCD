//
//  ItemRowView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 13/10/2022.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var item: Item
    
    var body: some View {
        NavigationLink(destination: EditItemView(item: item)) {
            HStack {
                // TODO: Add checkbox view here
                Text(item.itemName)
                Text("\(item.quantity) \(item.itemUnit)")
                
            }
           
        }
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: Item.example)
    }
}
