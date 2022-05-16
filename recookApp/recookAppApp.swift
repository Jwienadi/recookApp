//
//  recookAppApp.swift
//  recookApp
//
//  Created by Jessica Wienadi on 08/02/22.
//

import SwiftUI

@main
struct recookAppApp: App {
    let persistenceController = PersistenceController.shared
    
    @Environment(\.scenePhase) var scenePhase
    
//        let recipescdummy = [
//            Recipe(image: "default", title: "Nasi Goreng222", time: 120, yield: 5),
//            Recipe(image: "default", title: "Ayam Bakar Taliwang ala Tante Liliana222", time: 150, yield: 10),
//            Recipe(image: "default", title: "Soto Banjar", time: 120, yield: 5),
//            Recipe(image: "default", title: "Sate Babi bawah pohon", time: 150, yield: 10)
//            ]
        

    var body: some Scene {
        WindowGroup {
            MainView()

            
//            AddRecipeViewori()
//            AddIngredientRowView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { (newScenePhase) in
            switch newScenePhase {
            case .background:
                print("Scene in background")
                persistenceController.save()
            case .inactive:
                print("Scene in inactive")
            case .active:
                print("Scene in active")
            @unknown default:
                print("Apple must have changed something")
            }
    }
}
}
