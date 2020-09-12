//
//  SimpleBar.swift
//  Drawing
//
//  Created by Magdalena Toczek on 12/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit

@IBDesignable
class SimpleBar: UIView {

    
//    let data: [String: CGFloat] = [
//
//        "Mon" : 9,
//        "Tue" : 5,
//        "Wen" : 3,
//        "Thu" : 15,
//        "Fri" : 11,
//    ]
//
    
    let dataDays: [String] = [ "Mon", "Tue", "Wen", "Thu", "Fri" ]
    let dataValues: [CGFloat] = [9,5,3,15,11]
    

    override func draw(_ rect: CGRect) {
        
        let ctx = UIGraphicsGetCurrentContext()
        
        let howManyItems: CGFloat = CGFloat(dataDays.count)
        let maxValue : CGFloat = dataValues.max()!
        
        let viewWidth = bounds.width
        let viewHeight = bounds.height
        let padding : CGFloat = 30
    
        
        let viewHeightMinusPadding = viewHeight - (2 * padding)
        let viewWidthMinusPading = viewWidth - (2 * padding)
        
        
        let unitForHeight = viewHeightMinusPadding/(maxValue)
        
        
        
        
        
        var barStartWidth : CGFloat = (viewWidth - viewWidthMinusPading)/2
        var lineStartPosition : CGFloat = (viewWidth - viewWidthMinusPading)/2
        var lineEndPosition : CGFloat = lineStartPosition + (maxValue * unitForHeight)
       
        //lines
        for x in (0...15).reversed() {
             ctx?.saveGState()
            let path = UIBezierPath(rect: CGRect(x: barStartWidth, y: lineStartPosition, width: viewWidthMinusPading, height: 1))
            
            
            let font = UIFont(name: "Avenir-Medium", size:8)!
            let labelAttributes = [NSAttributedString.Key.font : font,
                                             NSAttributedString.Key.foregroundColor : UIColor.black]
                      
            let numberLabel = String(x) as NSString
                      
                      
            numberLabel.draw(at: CGPoint(x:barStartWidth - 10 , y: lineStartPosition - 4), withAttributes: labelAttributes)
                    
            
            lineStartPosition = lineStartPosition + unitForHeight
            #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1).setFill()
            path.fill()
            
          
            
            ctx?.restoreGState()
        }
        
        
        
        
        
        let columnWidth: CGFloat = 20
        let paddingForColumns = (viewWidthMinusPading - ((howManyItems + 2) * columnWidth)) / howManyItems
        print(paddingForColumns)
        var startPosition = barStartWidth + paddingForColumns
    
        
        var x = 0
        for value in dataValues {
           
            ctx?.saveGState()
            let heightColumn = -(value * unitForHeight)
            
            let path = UIBezierPath(rect: CGRect(x: startPosition, y: lineEndPosition, width: columnWidth, height: heightColumn))
            
            
            let font = UIFont(name: "Avenir-Medium", size:8)!
            let labelAttributes = [NSAttributedString.Key.font : font,
                                                     NSAttributedString.Key.foregroundColor : UIColor.black]
                              
            let dayLabel = String(dataDays[x]) as NSString
                   x = x + 1
                              
            dayLabel.draw(at: CGPoint(x:startPosition + 3 , y: lineEndPosition + 5), withAttributes: labelAttributes)
        
            startPosition = startPosition + columnWidth + paddingForColumns
            
            let columnRandomColor = UIColor(red: .random(in: 0...1), green: .random(in: 0...1), blue: .random(in: 0...1), alpha: 1.0)
            
            
            columnRandomColor.setFill()
            path.fill()
            ctx?.restoreGState()
            
        }
        
        
        
        
        
 
    }
 

}
