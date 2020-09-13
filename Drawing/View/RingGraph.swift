//
//  RingGraph.swift
//  Drawing
//
//  Created by Magdalena Toczek on 13/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

@IBDesignable
class RingGraph: UIView {

    let padding: CGFloat = 70
    var stokeEndVariable: CGFloat = 0.01
    
    let circleColorLayer = CAShapeLayer()

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        let height = bounds.height
        
        let midleX = bounds.midX
        let midleY = bounds.midY
        let size = height - padding
        
        
       
        let circleMainLayer = CAShapeLayer()
        circleMainLayer.frame = CGRect(x: midleX - size/2, y: midleY - 100, width: size, height: size)
        let circleMainPath = UIBezierPath(ovalIn:CGRect(x: 0, y: 0, width: size, height: size))
        
        circleMainLayer.path = circleMainPath.cgPath
        circleMainLayer.fillColor = nil
        circleMainLayer.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        circleMainLayer.lineWidth = 20.0
        layer.addSublayer(circleMainLayer)
        
       
    
        
               circleColorLayer.path = circleMainPath.cgPath
               circleColorLayer.fillColor = nil
               circleColorLayer.frame = CGRect(x: midleX - size/2, y: midleY - 100, width: size, height: size)
               circleColorLayer.lineCap = CAShapeLayerLineCap.round
               circleColorLayer.transform = CATransform3DMakeRotation((3 * .pi)/2, 0, 0, 1.0)
               circleColorLayer.strokeEnd = stokeEndVariable
               circleColorLayer.strokeColor = #colorLiteral(red: 0.521568656, green: 0.1098039225, blue: 0.05098039284, alpha: 1)
               circleColorLayer.lineWidth = 20.0
        
        
               let gradientLayer = CAGradientLayer()
               gradientLayer.frame = bounds
               let colors: [CGColor] = [#colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1).cgColor,#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1).cgColor]
               gradientLayer.colors = colors
               gradientLayer.mask = circleColorLayer
        
        
             //  layer.addSublayer(circleColorLayer)
                layer.addSublayer(gradientLayer)
        
        
        
    
    }
    
    func changeTheStrokeEnd(newValueFromSlider :CGFloat){
        circleColorLayer.strokeEnd = newValueFromSlider
     
        
        
    }
    
    
    
}
