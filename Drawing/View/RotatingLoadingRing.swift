//
//  RotatingLoadingRing.swift
//  Drawing
//
//  Created by Magdalena Toczek on 14/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

@IBDesignable
class RotatingLoadingRing: UIView {

    
    let circleLayer = CALayer()
    let circleSize: CGFloat = 20
    let replicatorLayer = CAReplicatorLayer()
    let duration: TimeInterval = 2.0
    
    
    override func draw(_ rect: CGRect) {
        
       
        
    }
    
    
    
    override func didMoveToSuperview() {
        
        
        let b = (bounds.width - bounds.height)/2
        
        circleLayer.frame = CGRect(x:b, y:circleSize, width: circleSize, height:  circleSize)
        circleLayer.cornerRadius = circleSize/2
        circleLayer.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        
        
                       
        
        let animation2 = CABasicAnimation(keyPath: "opacity")
                   animation2.fromValue = 1
                   animation2.toValue = 0
                   animation2.duration = 3
                   animation2.repeatCount = .infinity
                   circleLayer.add(animation2, forKey: nil)
        
        
        
        
        let instanceCount = 12
        let angle:CGFloat = CGFloat((2 * (Double.pi))/Double(instanceCount))
                   
   
        replicatorLayer.frame = CGRect(x:circleLayer.frame.origin.x - circleSize/2, y: 0, width: bounds.height , height: bounds.height)
        replicatorLayer.instanceTransform = CATransform3DMakeRotation(CGFloat(angle), 0, 0.0, 1.0)
        replicatorLayer.instanceCount = instanceCount
        replicatorLayer.instanceDelay = animation2.duration/Double(instanceCount)
        replicatorLayer.addSublayer(circleLayer)
        layer.addSublayer(replicatorLayer)

        
    }
   

}
