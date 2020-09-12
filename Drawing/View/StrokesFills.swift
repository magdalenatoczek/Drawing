//
//  StrokesFiils.swift
//  Drawing
//
//  Created by Magdalena Toczek on 12/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

@IBDesignable
class StrokesFills: UIView {


    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()!
        ctx.setFillColor(#colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1))
        ctx.setStrokeColor(#colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1))
        
        
        let rectPath = UIBezierPath(rect: (CGRect(x: 2, y: 2, width: 180, height: 90)))
            rectPath.fill()
        
        
        let trianglePath = UIBezierPath()
        trianglePath.move(to: CGPoint(x: 2, y: 95))
        trianglePath.addLine(to: CGPoint(x: 102, y: 95))
        trianglePath.addLine(to: CGPoint(x: 51, y: 180))
        trianglePath.close()
        #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1).setFill()
       // UIColor.red.setFill()
        trianglePath.fill()
        
        
        let circlePath = UIBezierPath(ovalIn: CGRect(x: 50, y: 50, width: 90, height: 90))
        #colorLiteral(red: 0.2745098174, green: 0.4862745106, blue: 0.1411764771, alpha: 1).setFill()
        circlePath.fill()
        
        
        
        let centerX = rect.midX
        let centerY = rect.midY
        //or (bounds.width/2) (bounds.height/2)
        let center = CGPoint(x: centerX, y:centerY)
        
        
        let startAngleInRadians: CGFloat = 3 * .pi/2 // 270/180 * pi
        let endAngleInRadians: CGFloat = 8 * .pi/9   // 160/180 * pi
        
//        or
//        let startAngleInDegrees: CGFloat = 270 * CGFloat(Double.pi)/180
//        let endAngleInDegrees: CGFloat = 160 * CGFloat(Double.pi)/180
        
        
        let arcRadius: CGFloat = bounds.height/2
        
       
        let arcPath = UIBezierPath(arcCenter: center, radius: arcRadius - 18, startAngle: startAngleInRadians, endAngle: endAngleInRadians, clockwise: true)
        
         arcPath.lineWidth = 36
  
        #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1).setStroke()
        arcPath.stroke()
        
        
        
// =======================================================================
//        ctx.move(to: CGPoint(x: 0, y: 0))
//        ctx.addLine(to: CGPoint(x: 180, y: 0))
//        ctx.addLine(to: CGPoint(x: 180, y: 90))
//        ctx.addLine(to: CGPoint(x: 0, y: 90))
//      //  ctx.addLine(to: CGPoint(x: 0, y: 0))
//        ctx.closePath()
//        ctx.fillPath()
// =======================================================================
//        let myRectPath = CGMutablePath()
//        myRectPath.move(to: CGPoint(x: 0, y: 0))
//        myRectPath.addLine(to: CGPoint(x: 180, y: 0))
//        myRectPath.addLine(to: CGPoint(x: 180, y: 90))
//        myRectPath.addLine(to: CGPoint(x: 0, y: 90))
// =======================================================================
//        myRectPath.closeSubpath()
//        ctx.addPath(myRectPath)
//       // ctx.fillPath()
//        ctx.strokePath()
//        //have way inside have way outside
// =======================================================================
//        let myRectPath = CGMutablePath()
//        myRectPath.move(to: CGPoint(x: 2, y: 2))
//        myRectPath.addLine(to: CGPoint(x: 182, y: 2))
//        myRectPath.addLine(to: CGPoint(x: 182, y: 92))
//        myRectPath.addLine(to: CGPoint(x: 2, y: 92))
//
//        myRectPath.closeSubpath()
//        ctx.addPath(myRectPath)
//        ctx.setLineWidth(6.5)
//        ctx.strokePath()
// =======================================================================
//        let rectPath = UIBezierPath()
//        rectPath.move(to: CGPoint(x: 2, y: 2))
//        rectPath.addLine(to: CGPoint(x: 182, y: 2))
//        rectPath.addLine(to: CGPoint(x: 182, y: 92))
//        rectPath.addLine(to: CGPoint(x: 2, y: 92))
//        rectPath.fill()
        
    }
}
