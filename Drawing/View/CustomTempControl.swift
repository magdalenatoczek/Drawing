//
//  CustomTempControl.swift
//  Drawing
//
//  Created by Magdalena Toczek on 15/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit



class BallLayer: CAShapeLayer {
    
    override func action(forKey event: String) -> CAAction? {
        return nil
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        fillColor = UIColor.black.cgColor
        contentsScale = UIScreen.main.scale
        drawsAsynchronously = true
        needsDisplayOnBoundsChange = true
        setNeedsDisplay()

    }
 
}





@IBDesignable
class CustomTempControl: UIControl {

  
    let backShapeLayer = CAShapeLayer()
    let temperatureLabel = UILabel()
    let ballLayer = BallLayer()
    
    let ringWidth: CGFloat = 30.0
    let maxTemperature : Double = 31
    let padding: CGFloat = 10
   
    var textFont = UIFont.boldSystemFont(ofSize: 40)

    var halfRingWidth: CGFloat {
        return ringWidth/2
    }
    
    var centerPoint: CGPoint {
        return CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2)
    }
    
    var radius: CGFloat {
        return bounds.height/2 - (ringWidth/2.0)
    }
    

    var ballAngle : Int = 0 {
        didSet{

            var angle = ballAngle - 270
            if angle < 0 {

                angle += 360

            }

            let newTemp = Int(floor(Double(angle)/360 * maxTemperature))
            temperatureLabel.text = " \(newTemp)°"

        }

       }
    

    override func awakeFromNib() {
        
        temperatureLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(temperatureLabel)
        temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        temperatureLabel.textAlignment = NSTextAlignment.center
        temperatureLabel.textColor = #colorLiteral(red: 0.092517955, green: 0.03103513594, blue: 0.2262112185, alpha: 1)
        temperatureLabel.font = textFont
        temperatureLabel.text = " 0°"
    }
    
    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        
        
        let differenceBetweenWidthAndHeight = (bounds.width - bounds.height)/2
        let circlePath = UIBezierPath(ovalIn: CGRect(x: differenceBetweenWidthAndHeight + ringWidth/2, y: ringWidth/2, width: bounds.height - ringWidth, height: bounds.height - ringWidth)).cgPath
    
        backShapeLayer.path = circlePath
        backShapeLayer.frame = bounds
        backShapeLayer.lineWidth = ringWidth
        backShapeLayer.fillColor = nil
        backShapeLayer.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        backShapeLayer.strokeEnd = 1.0
        layer.addSublayer(backShapeLayer)
        
        
       
        let ballShape = UIBezierPath(ovalIn: CGRect(x: 0, y: 0, width: ringWidth, height: ringWidth))
        ballLayer.path = ballShape.cgPath
        ballLayer.frame = CGRect(x: 0, y: 0, width: ringWidth, height: ringWidth)
        ballLayer.position = CGPoint(x: frame.width/2  , y: ringWidth/2)
        ballLayer.fillColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        layer.addSublayer(ballLayer)
        
        
        
    }
    
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.beginTracking(touch, with: event)
        
        let touchPosition = touch.location(in: self)
        let ballFrame = ballLayer.frame
        if ballFrame.contains(touchPosition){
            
            return true
        }
        
        return false
        
    }
    
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        super.continueTracking(touch, with: event)
        
        let lastPoint = touch.location(in: self)

        moveBall(to : lastPoint)
        
        self.sendActions(for: UIControl.Event.valueChanged)
        
        return true
    }
    
    
    func moveBall(to point: CGPoint){
        
        let angle: Double = angleFromCenterToActualPosition(p1: centerPoint, p2: point)

        
        ballAngle = Int(angle)
        
        let actualAngle = Int (360 - angle)
                
        let newPositionForBall : CGPoint = getNewPositionFromAngle(actualAngle: Double(actualAngle))
        
        ballLayer.position = newPositionForBall
        

    }
    

    
    func getNewPositionFromAngle(actualAngle: Double) -> CGPoint {
        var newPosition: CGPoint = CGPoint.zero

    
        let degreesToRadians = (actualAngle * Double.pi) / 180
     
            let x = radius * CGFloat(cos(-degreesToRadians)) + centerPoint.x
            let y = radius * CGFloat(sin(-degreesToRadians)) + centerPoint.y
            newPosition.x = CGFloat(x)
            newPosition.y = CGFloat(y)
            

        
        return newPosition
    }
    
    
    
    
    
    
    
    func angleFromCenterToActualPosition(p1:CGPoint, p2: CGPoint) -> Double {
        
        let vectorX: CGFloat = p2.x - p1.x
        let vectorY: CGFloat  = p2.y - p1.y
        let d : CGFloat = sqrt( pow(p2.x-p1.x, 2) + pow(p2.y - p1.y, 2))
        let radians = Double (atan2(vectorY/d, vectorX/d))
        let degrees = (radians * 180) / Double.pi
        let result = degrees >= 0 ? degrees : degrees + 360
       
        return result
 
    }
    
    
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        super.endTracking(touch, with: event)
        layoutSubviews()
    }
    
    
    
}
