//
//  MainView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 14/03/22.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
                   RecipesView()
                       .tabItem {
                           Label("Recipes", systemImage: "fork.knife")
                       }

                   CategoriesView()
                       .tabItem {
                           Label("Categories", systemImage: "rectangle.3.group")
                       }
               }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
