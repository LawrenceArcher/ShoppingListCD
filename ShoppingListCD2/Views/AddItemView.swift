//
//  AddItemView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 20/10/2022.
//

import SwiftUI
import CoreData

struct AddItemView: View {
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    let itemLabels: FetchRequest<ItemLabel>
    let items: FetchRequest<Item>
    
    @State private var name = ""
    @State private var quantity = 1
    @State private var unit = ""
    @State private var itemLabel: ItemLabel?
    @State private var itemLabelName = ""
    
    init() {
        itemLabels = FetchRequest<ItemLabel>(entity: ItemLabel.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ItemLabel.name, ascending: true)])
        items = FetchRequest<Item>(entity: Item.entity(), sortDescriptors: [])
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
                                    itemLabelName = item.labelName
                                }
                            if item == itemLabel {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
                Section {
                    Button("Save") {
                        var itemAlreadyInList = false
                        // if name already in item list add quantity
                        items.wrappedValue.forEach { item in
                            if item.name == name {
                                itemAlreadyInList = true
                            }
                        }
                        
                        if itemAlreadyInList {
                            // select item from memory
                            print("I'm already in here!")
                            
                            let fetchRequest: NSFetchRequest<Item>
                            fetchRequest = Item.fetchRequest()
                            
                            fetchRequest.predicate = NSPredicate(
                                format: "name LIKE %@", name
                            )
                            
                            do {
                                let itemToChange = try moc.fetch(fetchRequest)
                                // add new quantity to existing value
                                print(itemToChange)
                                itemToChange.first!.quantity += Int16(quantity)
                            } catch {
                                print("couldn't find item")
                            }
                            
                            dataController.save()
                            dismiss()
                            // item check to happen here.
                            
                            // start by checking for the existence of the item in the existing "active" list
                            
                            // if it exists then increase the amount of the label
                            
                            // add an option to request a merge if there's a different unit
                            
                        } else {
                            let item = Item(context: moc)
                            item.name = name
                            item.quantity = Int16(quantity)
                            item.unit = unit
                            item.createdAt = Date()
                            item.toBuy = true
                            item.labelName = itemLabelName
                            
                            dataController.save()
                            dismiss()
                        }
                    }
                }
            }
        }
    }
}
