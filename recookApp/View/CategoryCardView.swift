//
//  CategoryCardView.swift
//  recookApp
//
//  Created by Jessica Wienadi on 21/03/22.
//

import SwiftUI

struct CategoryCardView: View {
    
    let category: String
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0){
//            ZStack{
//                ShapeCategory()
//                    .fill(.white)
//                    .frame(width: 70, height: 85)
//
                Text(category)
                    .font(.headline)
                    .foregroundColor(.black)
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                    .frame(width: 95, alignment: .bottomLeading)
                    .scaledToFit()
                    .minimumScaleFactor(0.01)
                    .lineLimit(1)
            
            
                
//            }
            //ganti "category" klo foto udah kumpul
            Image("default")
                .resizable()
                .scaledToFill()
                .frame(alignment: .trailing)
                .frame(width: 75, height: 85)
                .clipShape(ShapeCategory())
//                .clipped()
                
                
//                .clipShape(shape: ShapeCategory)
//                .cornerRadius(30, corners)
        }
        .background(.white)
//        .frame(width: 160, height: 85)
        }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCategory = "Category"
        CategoryCardView(category: dummyCategory)
            .previewLayout(.sizeThatFits)
        
    }
}
