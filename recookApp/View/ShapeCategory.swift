//
//  CategoryCurveShape.swift
//  recookApp
//
//  Created by Jessica Wienadi on 24/03/22.
//

import SwiftUI

//struct ShapeCategory: Shape {
//    func path(in rect: CGRect) -> Path {
//
//        var path = Path()
////        path.move(to: CGPoint(x: rect.minX, y: rect.minY))
////        path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.minY))
////        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.maxY), control: CGPoint(x: rect.maxX, y: rect.midY))
////        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//        //-------- up
////        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
//
////        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY)
//
//        path.move(to: CGPoint.zero)
//        path.addLine(to: CGPoint(x: rect.size.width / 1.5, y: 0))
//        path.addQuadCurve(to: CGPoint(x: rect.size.width / 1.2, y: rect.size.height), control: CGPoint(x: rect.maxX, y: rect.midY))
//        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
//
//        return path
//
//    }
//
//    }
struct ShapeCategory: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX/4, y: rect.maxY))
        path.addQuadCurve(to: CGPoint.zero, control: CGPoint(x: rect.maxX/4, y: rect.maxX/3))
                     
        
        return path
    }}

struct ShapeCategory_Previews: PreviewProvider {
    static var previews: some View {
        ShapeCategory()
            .frame(height: 300)
    }
}

