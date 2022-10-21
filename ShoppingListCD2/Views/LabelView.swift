//
//  LabelsView.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 10/10/2022.
//

import SwiftUI

struct LabelView: View {
    let label: Label
    
    var body: some View {
        ZStack (alignment: .center) {
            Text(label.labelName)
                .frame(height: 50)
                .padding(.horizontal, 10)
                .background(Color(label.labelColour))
            // TODO: Ensure that this changes when clicked & explain which label is currently selected
                .cornerRadius(15)
            // TODO: If text colour doesn't work with background, need to catch + change!
        }
    }
}

struct LabelView_Previews: PreviewProvider {
    static var previews: some View {
        LabelView(label: Label.example)
    }
}
