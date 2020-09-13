//
//  ShapeTransformation.swift
//  Drawing
//
//  Created by Magdalena Toczek on 13/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

@IBDesignable
class ShapeTransformation: UIView {

 
    override func didMoveToSuperview() {
           super.didMoveToSuperview()
           
        let squareLayer = CAShapeLayer()
           squareLayer.path = UIBezierPath(rect: CGRect(x: 0, y: 0, width: 100, height: 100)).cgPath
        
           squareLayer.frame = CGRect(x: bounds.midX - 50, y: bounds.midY - 50, width: 100, height: 100)
           squareLayer.fillColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
           squareLayer.strokeColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
           squareLayer.lineWidth = 3.0
           squareLayer.lineJoin = CAShapeLayerLineJoin.round
        
        let angle = 45 * CGFloat(Double.pi)/180
        
        //rotation from the middle - but we must have the frame!
        // squareLayer.transform = CATransform3DMakeRotation(angle, 0, 0, 1.0)  //2d
       //squareLayer.transform = CATransform3DMakeTranslation(50, 50, 0)
        squareLayer.transform = CATransform3DMakeScale(0.5, 0.5, 1.0)
      
        
        
           layer.addSublayer(squareLayer)
           
        
        
        
    }
    
    
}
