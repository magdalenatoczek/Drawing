//
//  ShapeMask.swift
//  Drawing
//
//  Created by Magdalena Toczek on 13/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

@IBDesignable


class ShapeMask: UIView {

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        let lineWidth : CGFloat = 20
        let shape = CAShapeLayer()
        shape.path = UIBezierPath(ovalIn: CGRect(x: lineWidth/2, y: lineWidth/2, width: (bounds.height)-lineWidth, height: bounds.height-lineWidth)).cgPath
        
        shape.frame = bounds
        shape.fillColor = nil
        shape.lineWidth = lineWidth
        shape.strokeColor = UIColor.black.cgColor
      //  layer.addSublayer(shape)
        
        
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        let colors: [CGColor] = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1).cgColor,#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor]
        gradientLayer.colors = colors
        gradientLayer.mask = shape
        
        layer.addSublayer(gradientLayer)
        
        
        
    }
}
