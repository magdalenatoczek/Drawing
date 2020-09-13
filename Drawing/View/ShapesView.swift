//
//  ShapesView.swift
//  Drawing
//
//  Created by Magdalena Toczek on 13/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


@IBDesignable
class ShapesView: UIView {

   
    
    
    
    
    
    override class func awakeFromNib() {
        let shapeLayer = CAShapeLayer()
        
        shapeLayer.path = UIBezierPath(roundedRect: CGRect(x: 20, y: 20, width: 150, height: 80), cornerRadius: 30).cgPath
        
        shapeLayer.fillColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
        
       
        
        
    }

}
