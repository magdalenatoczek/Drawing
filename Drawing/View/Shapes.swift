//
//  Shapes.swift
//  Drawing
//
//  Created by Magdalena Toczek on 13/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

@IBDesignable
class Shapes: UIView {

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        let squareLayer = CAShapeLayer()
        squareLayer.path = UIBezierPath(rect: CGRect(x: 20, y: 20, width: 200, height: 100)).cgPath
        squareLayer.fillColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        squareLayer.strokeColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        squareLayer.lineWidth = 10.0
        squareLayer.lineJoin = CAShapeLayerLineJoin.bevel
        layer.addSublayer(squareLayer)
        
        
        
        
        let circleLayer = CAShapeLayer()
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: 40, y: 130, width: 80, height: 80)).cgPath
        circleLayer.fillColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        circleLayer.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        circleLayer.lineJoin = CAShapeLayerLineJoin.round
        circleLayer.strokeEnd = 0.7   //between 0-1
        circleLayer.lineCap = CAShapeLayerLineCap.round
        circleLayer.lineWidth = 4.0
        layer.addSublayer(circleLayer)
        
        
        
        let combineShape = CAShapeLayer()
        let combinePath = UIBezierPath()
        
        let circle1  = UIBezierPath(ovalIn: CGRect(x: 120, y: 120, width: 60, height: 60))
        let circle2 = UIBezierPath(ovalIn: CGRect(x: 120, y: 160, width: 40, height: 40))
        
        combinePath.append(circle1)
        combinePath.append(circle2)
        
        //circle position relative to frame - frame is needed o avoid problems
        combineShape.frame = CGRect(x: 120, y: 0, width: 240, height: 240)
        
        combineShape.path = combinePath.cgPath
        combineShape.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        combineShape.fillColor = nil
        combineShape.lineDashPattern = [4, 3]
        //combineShape.lineDashPhase = 10  //offset from start
        combineShape.lineWidth = 3.0
        layer.addSublayer(combineShape)
        

        
    }
    

}
