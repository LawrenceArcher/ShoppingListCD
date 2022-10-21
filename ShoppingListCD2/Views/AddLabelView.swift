//
//  AddLabelView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 21/10/2022.
//

import SwiftUI

struct AddLabelView: View {
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var colour = "Light Blue"
    
    
    let colourColumns = [
        GridItem(.adaptive(minimum: 44))
    ]
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Label name", text: $name)
                    
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
                        let itemLabel = ItemLabel(context: moc)
                        
                        itemLabel.name = name
                        itemLabel.colour = colour
                        
                        dataController.save()
                        dismiss()
                    }
                }
            }
        }
    }
}
