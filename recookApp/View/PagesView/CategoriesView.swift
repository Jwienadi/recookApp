//
//  CategoriesView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 14/03/22.
//

import SwiftUI

struct CategoriesView: View {
    
    let categories = ["Uncategorized","Breakfast", "Rice","Noodle","Salad","Soup","Dessert","Beef","Chicken","Seafood","Vegetable","Beverage","Side Dish","Baking"]
    
    var items: [GridItem] = [GridItem(.fixed(180)), GridItem(.fixed(180))]
    
    
    var body: some View {
        NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        
          LazyVGrid(columns: items, spacing: 10) {
              ForEach(categories, id: \.self) { category in
                  NavigationLink(destination: ListCategoryView(category: category)) {
            CategoryCardView(category: category)
                      .cornerRadius(5)
                      .shadow(color: .black.opacity(0.35), radius: 1, x: 0, y: 2)
                  }
                  
        }
      }
    }
      .navigationTitle("Categories")
      .navigationBarTitleDisplayMode(.inline)
    }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}