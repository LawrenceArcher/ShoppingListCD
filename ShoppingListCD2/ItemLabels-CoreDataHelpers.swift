//
//  Labels-CoreDataHelpers.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 10/10/2022.
//

import Foundation

extension ItemLabel {
    static let colours = ["Pink", "Purple", "Red", "Orange", "Gold", "Green", "Teal", "Light Blue", "Dark Blue", "Midnight", "Dark Grey", "Grey"]
    
    var labelName: String {
        name ?? ""
    }
    
    var labelColour: String {
        colour ?? "Light Blue"
    }
    
    static var example: ItemLabel {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let itemLabel = ItemLabel(context: viewContext)
        itemLabel.name = "marmite"
        itemLabel.colour = "Light Blue"
        
        return itemLabel
    }
}
