//
//  CategoriesView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 14/03/22.
//

import SwiftUI

struct CategoriesView: View {
    var items: [GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    
    var body: some View {
        NavigationView {
      ScrollView(.vertical, showsIndicators: false) {
        
          LazyVGrid(columns: items, spacing: 10) {
              ForEach(categories, id: \.self) { category in
                  NavigationLink(destination: ListCategoryView(category: category)) {
                  CategoryCardView(category: category)
//                          .padding()
                       .cornerRadius(5)
                       .shadow(color: .black.opacity(0.35), radius: 1, x: 0, y: 2)
                                   }
                  
        }
      }
    }
      .padding(.horizontal, 10)
      .navigationTitle("Categories")
      .navigationBarTitleDisplayMode(.inline)
    }
        .navigationViewStyle(.stack)
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
            .previewDevice(PreviewDevice(rawValue: "iPad Pro (11-inch) (3rd generation)"))
        CategoriesView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12"))
            .previewInterfaceOrientation(.portrait)
    }
}
