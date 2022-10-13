//
//  LabelsView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 10/10/2022.
//

import SwiftUI

struct LabelsView: View {
    let labels: FetchRequest<Label>
    
    init() {
        labels = FetchRequest<Label>(entity: Label.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \Label.name, ascending: true)])
    }
    
    var body: some View {
        NavigationView {
            List {
                ForEach(labels.wrappedValue) { label in
                    Section(header: Text(label.name ?? "")) {
                        ForEach(label.items?.allObjects as? [Item] ?? []) { item in
                            Text(item.name ?? "")
                        }
                    }
                }
            }
        }
    }
}

struct LabelsView_Previews: PreviewProvider {
    static var previews: some View {
        LabelsView()
    }
}
