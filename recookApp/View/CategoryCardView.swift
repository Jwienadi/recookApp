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
//                    .lineLimit(2)
//                    .multilineTextAlignment(.leading)
//                    .scaledToFit()
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .frame(minWidth: 70, idealWidth: 75)
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                    .font(.headline)
                    .foregroundColor(.black)
//
////                    .frame(minWidth: 80)
////                    .frame(width: 85, alignment: .bottomLeading)
////                    .scaledToFit()
////                    .minimumScaleFactor(0.001)
//                    .frame(alignment: .leading)
                    .fixedSize(horizontal: false, vertical: true)
//
//                    .frame(alignment: .bottomLeading)
//                    .scaledTo
                    
                    
                    
            
            
                
//            }
            //ganti "category" klo foto udah kumpul
            Image(category == "Soup /Stew" ? "soup_stew": category.lowercased())
                .resizable()
                .scaledToFill()
                .frame(minHeight: 90, maxHeight: 180)
                .frame(minWidth: 70, idealWidth: 70)
//                .frame(minWidth: 80)
                .frame(alignment: .trailing)
//                .frame(width: 85, height: 85)
                .clipShape(ShapeCategory())
            
//                .clipped()
                
                
//                .clipShape(shape: ShapeCategory)
//                .cornerRadius(30, corners)
        }
//        .aspectRatio(3/2, contentMode: .fit)
        .background(.white)
        
//        .frame(width: 160, height: 85)
        }
}

struct CategoryCardView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyCategory = "no category"
        CategoryCardView(category: dummyCategory)
            .previewLayout(.sizeThatFits)
        
    }
}
