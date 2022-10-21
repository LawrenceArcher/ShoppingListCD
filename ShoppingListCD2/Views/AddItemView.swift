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
    
    let itemLabels: FetchRequest<ItemLabel>
    
    @State private var name = ""
    @State private var quantity = 1
    @State private var unit = ""
    @State private var itemLabel: ItemLabel?
    
    init() {
        itemLabels = FetchRequest<ItemLabel>(entity: ItemLabel.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ItemLabel.name, ascending: true)])
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section (header: Text("Add item details")){
                    TextField("Item name", text: $name)
                    TextField("Quantity", value: $quantity, format: .number)
                        .keyboardType(.numberPad)
                    TextField("Unit", text: $unit)
                }
                Section (header: Text("Add Item Label")) {
                    ForEach(itemLabels.wrappedValue) { item in
                        HStack {
                            Text(item.labelName)
                                .foregroundColor(Color(item.labelColour))
                                .onTapGesture {
                                    itemLabel = item
                                }
                        }
                    }
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
