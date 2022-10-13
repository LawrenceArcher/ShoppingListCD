//
//  EditItemView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 13/10/2022.
//

import SwiftUI

struct EditItemView: View {
    let item: Item
    
    @EnvironmentObject var dataController: DataController
    
    @State private var name: String
    @State private var quantity: Int
    @State private var unit: String
    @State private var toBuy: Bool
    
    init(item: Item) {
        self.item = item
        _name = State(wrappedValue: item.itemName)
        _unit = State(wrappedValue: item.itemUnit)
        _quantity = State(wrappedValue: Int(item.quantity))
        _toBuy = State(wrappedValue: item.toBuy)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Item information")) {
                TextField("Item name", text: $name)
                TextField("Quantity", value: $quantity, format: .number)
                TextField("Unit", text: $unit)
            }
        }
        .navigationTitle("Edit item")
        .onDisappear(perform: dataController.save)
        .onChange(of:name) {_ in update() }
        .onChange(of:quantity) {_ in update() }
        .onChange(of:unit) {_ in update() }
    }
    
    func update() {
        item.label?.objectWillChange.send()
        
        item.name = name
        item.quantity = Int16(quantity)
        item.unit = unit
        item.toBuy = true
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(item: Item.example)
    }
}
