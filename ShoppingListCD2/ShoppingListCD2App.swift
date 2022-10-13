//
//  ShoppingListCD2App.swift
//  ShoppingListCD2
//
//  Created by Lawrence Archer on 09/10/2022.
//

import SwiftUI

@main
struct ShoppingListCD2App: App {
    @StateObject var dataController: DataController
    
    init() {
        let dataController = DataController()
        _dataController = StateObject(wrappedValue: dataController)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(dataController)
        }
    }
}
