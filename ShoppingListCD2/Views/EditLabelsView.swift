//
//  EditLabelView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 12/11/2022.
//

import SwiftUI

struct EditLabelsView: View {
    @EnvironmentObject var dataController: DataController
    @Environment(\.managedObjectContext) var moc
    
    let itemLabels: FetchRequest<ItemLabel>
    
    init() {
        itemLabels = FetchRequest<ItemLabel>(entity: ItemLabel.entity(), sortDescriptors: [
            NSSortDescriptor(keyPath: \ItemLabel.name, ascending: true)
        ])
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(itemLabels.wrappedValue) { itemLabel in
                    NavigationLink(destination: EditLabelView(itemLabel: itemLabel)) {
                        Text(itemLabel.labelName)
                    }
                }
            }
            .navigationTitle("Edit labels")
        }
    }
}

struct EditLabelsView_Previews: PreviewProvider {
    static var previews: some View {
        EditLabelsView()
    }
}
