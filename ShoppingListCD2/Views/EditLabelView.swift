//
//  EditLabelView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 15/11/2022.
//

import SwiftUI

struct EditLabelView: View {
    let itemLabel: ItemLabel
    
    @EnvironmentObject var dataController: DataController
    
    @State private var name: String
    @State private var colour: String
    
    let colourColumns = [
        GridItem(.adaptive(minimum: 44))
    ]
    
    init(itemLabel: ItemLabel) {
        self.itemLabel = itemLabel
        _name = State(wrappedValue: itemLabel.labelName)
        _colour = State(wrappedValue: itemLabel.labelColour)
    }
    
    var body: some View {
        Form {
            Section(header: Text("Title")) {
                TextField("Label name", text: $name.onChange(update))
            }
            Section (header: Text("Colour")) {
                LazyVGrid(columns: colourColumns) {
                    ForEach(ItemLabel.colours, id: \.self) { item in
                        ZStack {
                            Color(item)
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(6)
                            
                            if item == colour {
                                Image(systemName: "checkmark.circle")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                            }
                        }
                        .onTapGesture {
                            colour = item
                        }
                    }
                }
                .padding()
            }
            Section {
                Button("Save") {
                    itemLabel.name = name
                    itemLabel.colour = colour
                    
                    dataController.save()
                }
            }
        }
    }
    
    func update() {
        itemLabel.objectWillChange.send()
        
        itemLabel.name = name
        itemLabel.colour = colour
    }
}
