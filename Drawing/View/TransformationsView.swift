//
//  TransformationsView.swift
//  Drawing
//
//  Created by Magdalena Toczek on 12/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//


import UIKit


@IBDesignable
class TransformationsView: UIView {

    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        let rotateAngle: CGFloat = 45 * .pi/180
    
        
        let squareWidth : CGFloat = 120
        
        let viewWidth = bounds.width
        let viewHeight = bounds.height
        
        
        //square center  - 0.0
        
        let squarePath = UIBezierPath(roundedRect: CGRect(x: -squareWidth/2, y: -squareWidth/2, width: squareWidth, height: squareWidth), cornerRadius: 20)
        
        
        var transform = CGAffineTransform(translationX: viewWidth/2, y: viewHeight/2).rotated(by: rotateAngle).scaledBy(x: 1.2, y: 1.2)
    
        squarePath.apply(transform)
        // or
        //ctx?.concatenate(transform)  //but here saving and restoring state

        #colorLiteral(red: 1, green: 0.5734065159, blue: 0.9440995752, alpha: 1).setFill()
        squarePath.fill()
        
// =======================================================================
//        let ctx = UIGraphicsGetCurrentContext()
//              let rotateAngle: CGFloat = 45 * .pi/180
//
//
//              let squareWidth : CGFloat = 120
//
//              let viewWidth = bounds.width
//              let viewHeight = bounds.height
//
//
//              //square center  - 0.0
//
//              let squarePath = UIBezierPath(roundedRect: CGRect(x: -squareWidth/2, y: -squareWidth/2, width: squareWidth, height: squareWidth), cornerRadius: 20)
//
//              //translate to right position
//              ctx?.translateBy(x: viewWidth/2, y: viewHeight/2)
//              ctx?.rotate(by: rotateAngle)
//              ctx?.scaleBy(x: 1.2, y: 1.2)
//
//
//              #colorLiteral(red: 0.3272869131, green: 1, blue: 0.8766460422, alpha: 1).setFill()
//              squarePath.fill()
        
// =======================================================================
//        let ctx = UIGraphicsGetCurrentContext()
//               let rotateAngle: CGFloat = 45 * .pi/180
//               ctx?.rotate(by: rotateAngle)
//
//               let squareWidth : CGFloat = 120
//
//               let viewWidth = bounds.width
//               let viewHeight = bounds.height
//
//
//               let squarePath = UIBezierPath(roundedRect: CGRect(x: viewWidth/2 - squareWidth/2, y: viewHeight/2 - squareWidth/2, width: squareWidth, height: squareWidth), cornerRadius: 20)
//
//               #colorLiteral(red: 0.3272869131, green: 1, blue: 0.8766460422, alpha: 1).setFill()
//               squarePath.fill()
        
        
        
    }
   

}
