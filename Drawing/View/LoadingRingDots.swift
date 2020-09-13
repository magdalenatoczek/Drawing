//
//  LoadingRingDots.swift
//  Drawing
//
//  Created by Magdalena Toczek on 13/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit
@IBDesignable
class LoadingRingDots: UIView {

     override func didMoveToSuperview() {
            super.didMoveToSuperview()
        
    
        makeProgressBarMadeOfCircles(howManyCircles: 6, bigDiamiter: 90, smallCircleSize: 20)
     
            
    }
    
    func makeProgressBarMadeOfCircles (howManyCircles : Int, bigDiamiter: CGFloat, smallCircleSize :CGFloat){
    
        let bigRadius: CGFloat = bigDiamiter/2
        let frame = CGRect(x: bounds.midX-bigRadius, y: bounds.midY-bigRadius, width: bigDiamiter, height:bigDiamiter)
        
        
        let firstPositionX = frame.width/2 - smallCircleSize/2
        let firstPositionY :CGFloat = 0.0
        

        var firstAngle : CGFloat = CGFloat(360/howManyCircles)
        let bevel = firstAngle
        var shiftDown : CGFloat = 0.0
        var shiftRight : CGFloat = 0.0
        
        for _ in 1...howManyCircles {
            
            let halfOfAngle : CGFloat = firstAngle/2
            let secondAngle: CGFloat = (180 - firstAngle)/2
            let sinOfHalfAngle :CGFloat = sin(halfOfAngle * CGFloat(Double.pi)/180)
            let distanceBeetweenTopsOfCircles : CGFloat = 2 * sinOfHalfAngle * bigRadius
            let cosOfSecondAngle = cos(secondAngle * CGFloat(Double.pi)/180)
            let sinOfSecondAngle = sin(secondAngle * CGFloat(Double.pi)/180)
            shiftDown  = distanceBeetweenTopsOfCircles * cosOfSecondAngle
            shiftRight = distanceBeetweenTopsOfCircles * sinOfSecondAngle
            
            
            let circle = UIBezierPath(ovalIn: CGRect(x:firstPositionX + shiftRight , y: firstPositionY + shiftDown , width: smallCircleSize, height: smallCircleSize))
           
            let shapleLayer = CAShapeLayer()
            shapleLayer.frame = frame
            shapleLayer.path = circle.cgPath
            shapleLayer.fillColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0).cgColor
            layer.addSublayer(shapleLayer)
            
            
             firstAngle = firstAngle + bevel
            
            
            
        }
        
        
             
        
        
        
        
        
    }
    
    
    
    
    
        
}
