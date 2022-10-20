//
//  ContentView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 09/10/2022.
//

import SwiftUI

struct ContentView: View {
    let labels: FetchRequest<Label>
    @State private var selectedFilter = "*"
    @State private var showItemsToBuy = true
    
    init() {
        labels = FetchRequest<Label>(entity: Label.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Label.name, ascending: true)])
    }
    
    var body: some View {
        ItemListView(showItemsToBuy: showItemsToBuy, selectedFilter: selectedFilter)
        ScrollView (.horizontal) {
            HStack {
                ForEach(labels.wrappedValue) { label in
                    Button {
                        selectedFilter = label.labelName
                    } label: {
                        LabelView(label: label)
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
