//
//  ItemRowView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 13/10/2022.
//

import SwiftUI

struct ItemRowView: View {
    @ObservedObject var item: Item
    @State private var checked = false
    @EnvironmentObject var dataController: DataController
    
    var body: some View {
        NavigationLink(destination: EditItemView(item: item)) {
            HStack {
                Image(systemName: checked ? "checkmark.square.fill" : "square")
                    .foregroundColor(checked ? Color(UIColor.systemBlue) : Color.secondary)
                    .onTapGesture {
                        checked.toggle()
                        checkOffItem()
                    }
                Text(item.itemName)
                Spacer()
                Text("\(item.quantity) \(item.itemUnit)")
                
            }
           
        }
    }
    
    func checkOffItem() {
        //TODO: want to ensure there is some kind of timer before action here in case of an error + ability to revert
        
        // check if the item is stil checked off
        if checked == true {
            //TODO: actually get this to work
            item.toBuy = false
            dataController.save()
        }
        
    }
}

struct ItemRowView_Previews: PreviewProvider {
    static var previews: some View {
        ItemRowView(item: Item.example)
    }
}
