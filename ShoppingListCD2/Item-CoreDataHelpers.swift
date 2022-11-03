//
//  Item-CoreDataHelpers.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 10/10/2022.
//

import Foundation

extension Item {
    var itemName: String {
        name ?? ""
    }
    
    var itemCreatedAt: Date {
        createdAt ?? Date()
    }
    
    var itemUnit: String {
        unit ?? ""
    }
    
    var itemLabelName: String {
        itemLabel?.labelName ?? ""
    }
    
    static var example : Item {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let item = Item(context: viewContext)
        item.name = "Aubergine"
        item.quantity = 10
        item.createdAt = Date()
        item.toBuy = true
        item.unit = "kilograms"
        
        return item
    }
}
