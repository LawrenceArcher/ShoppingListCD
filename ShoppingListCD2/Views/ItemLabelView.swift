//
//  LabelsView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 10/10/2022.
//

import SwiftUI

struct ItemLabelView: View {
    let itemLabel: ItemLabel
    
    var body: some View {
        ZStack (alignment: .center) {
            Text(itemLabel.labelName)
                .frame(height: 50)
                .padding(.horizontal, 10)
                .background(Color(itemLabel.labelColour))
            // TODO: Ensure that this changes when clicked & explain which label is currently selected
                .cornerRadius(15)
                .foregroundColor(Color.black)
            // TODO: If text colour doesn't work with background, need to catch + change!
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        ItemLabelView(itemLabel: ItemLabel.example)
    }
}
