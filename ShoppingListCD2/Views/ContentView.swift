//
//  ContentView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 09/10/2022.
//

import SwiftUI

struct ContentView: View {
    let itemLabels: FetchRequest<ItemLabel>
    @State private var selectedFilter = "*"
    @State private var showItemsToBuy = true
    @State private var showingAddLabel = false
    
    @EnvironmentObject var dataController: DataController
    
    init() {
        itemLabels = FetchRequest<ItemLabel>(entity: ItemLabel.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \ItemLabel.name, ascending: true)])
    }
    
    var body: some View {
        NavigationView {
            VStack {
                ItemListView(showItemsToBuy: showItemsToBuy, selectedFilter: selectedFilter)
                ScrollView (.horizontal) {
                    HStack {
                        ForEach(itemLabels.wrappedValue) { itemLabel in
                            Button {
                                selectedFilter = itemLabel.labelName
                            } label: {
                                ItemLabelView(itemLabel: itemLabel)
                            }
                        }
                        Button("Add new Label") {
                            showingAddLabel.toggle()
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $showingAddLabel) {
            AddLabelView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
