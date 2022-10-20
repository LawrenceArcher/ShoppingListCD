//
//  Labels-CoreDataHelpers.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 10/10/2022.
//

import Foundation

extension Label {
    static let colours = ["Pink", "Purple", "Red", "Orange", "Gold", "Green", "Teal", "Light Blue", "Dark Blue", "Midnight", "Dark Grey", "Grey"]
    
    var labelName: String {
        name ?? ""
    }
    
    var labelColour: String {
        colour ?? "Light Blue"
    }
    
//    var labelItems: [Item] {
////        let itemsArray = items?.allObjects as? [Item] ?? []
//    }
    
    static var example: Label {
        let controller = DataController(inMemory: true)
        let viewContext = controller.container.viewContext
        
        let label = Label(context: viewContext)
        label.name = "marmite"
        label.colour = "Light Blue"
        
        return label
    }
}
