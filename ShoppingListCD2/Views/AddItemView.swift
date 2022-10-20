//
//  AddItemView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 20/10/2022.
//

import SwiftUI

struct AddItemView: View {
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var quantity = 1
    @State private var unit = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Item name", text: $name)
                    TextField("Quantity", value: $quantity, format: .number)
                        .keyboardType(.numberPad)
                    TextField("Unit", text: $unit)
                }
                Section {
                    Button("Save") {
                        let item = Item(context: moc)
                        item.name = name
                        item.quantity = Int16(quantity)
                        item.unit = unit
                        item.createdAt = Date()
                        item.toBuy = true
                        
                        dataController.save()
                        dismiss()
                    }
                }
            }
        }
    }
}
