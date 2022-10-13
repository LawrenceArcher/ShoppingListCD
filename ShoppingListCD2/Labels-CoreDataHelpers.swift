//
//  Labels-CoreDataHelpers.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 10/10/2022.
//

import Foundation

extension Label {
    var labelName: String {
        name ?? ""
    }
    
    var labelColor: String {
        color ?? ""
    }
    
//    var labelItems: [Item] {
////        let itemsArray = items?.allObjects as? [Item] ?? []
//    }
}
