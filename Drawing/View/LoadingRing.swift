//
//  LoadingRing.swift
//  Drawing
//
//  Created by Magdalena Toczek on 13/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


@IBDesignable
class LoadingRing: UIView {

   

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        let ringLayer = CAShapeLayer()
        ringLayer.frame = bounds
        
        let circle = UIBezierPath(ovalIn: CGRect(x: bounds.midX-80, y: bounds.midY-80, width: 160, height: 160))
        
        ringLayer.path = circle.cgPath
        ringLayer.fillColor = nil
        let radius : CGFloat = 80
        let amountOfDots : CGFloat = 200
        let ob =  2 * .pi * radius
        let pix: CGFloat = ob / amountOfDots
        let ns : NSNumber = pix as NSNumber
       // ringLayer.lineCap = CAShapeLayerLineCap.round
        ringLayer.lineDashPattern =  [ns]
        ringLayer.strokeColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
        ringLayer.lineWidth = 6.0
    
        
        let animation = CABasicAnimation(keyPath: "lineDashPhase")
//        animation.fromValue = 0
//        animation.toValue = ob
        animation.byValue = 10
        animation.duration = 0.2
        animation.repeatCount = .infinity
        animation.timingFunction = CAMediaTimingFunction(name: .linear)
        ringLayer.add(animation, forKey: nil)
        
//        let animation = CABasicAnimation(keyPath: "transform")
//        animation.byValue = CATransform3DMakeRotation(CGFloat(Double.pi), 0, 0, 1.0)
//                  animation.duration = 3
//                  animation.repeatCount = .infinity
//                animation.timingFunction = CAMediaTimingFunction(name: .linear)
//                  ringLayer.add(animation, forKey: nil)
        
        
        
        layer.addSublayer(ringLayer)
        
        
        
      
        
        
        
        
        
    }
    
    
    
}
