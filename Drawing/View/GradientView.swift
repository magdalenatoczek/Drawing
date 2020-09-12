//
//  GradientView.swift
//  Drawing
//
//  Created by Magdalena Toczek on 12/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


@IBDesignable
class GradientView: UIView {

   override func draw(_ rect: CGRect) {
           
    let ctx = UIGraphicsGetCurrentContext()!
    ctx.saveGState()
    
    let ovalPath = UIBezierPath(ovalIn: CGRect(x: 90, y: 20, width: 200, height: 200))
//    #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0).setFill()
//    ovalPath.fill()
    ovalPath.addClip()
    
    
    

    let firstColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1).cgColor
    let secondColor = #colorLiteral(red: 1, green: 0.2465148197, blue: 0.147129238, alpha: 1).cgColor
    let colors = [firstColor,secondColor]
    let colorLocations: [CGFloat] = [0.0, 1.0]
    let colorSpace = CGColorSpaceCreateDeviceRGB()
    let startPoint = CGPoint.zero
    let endPoint = CGPoint(x: 0.0, y: bounds.height)
    
    let gradient = CGGradient(colorsSpace: colorSpace, colors: colors as CFArray, locations: colorLocations)!
    
    ctx.drawLinearGradient(gradient, start: startPoint, end: endPoint, options: [])
    
    ctx.restoreGState()
    
    
    let arc = UIBezierPath(arcCenter: CGPoint(x: 0,y: 0), radius: 60, startAngle: 0, endAngle: .pi/2 , clockwise: true)
    
        #colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1).setStroke()
        arc.lineWidth = 40
        arc.stroke()
  
    ctx.saveGState()
    let shadowColor = UIColor.black.cgColor
    let shadowOffset = CGSize(width: 2.0, height: 2.0)
    let shadowBlurRadius: CGFloat = 5.0
    ctx.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadowColor)
    
    
    let oval = UIBezierPath(ovalIn: CGRect(x: 20, y: 100, width: 100, height: 100))
    #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1).setFill()
    oval.fill()
    ctx.restoreGState()
    
    
    
    
    }
    

}
