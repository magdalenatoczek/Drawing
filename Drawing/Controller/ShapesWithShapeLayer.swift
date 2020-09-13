//
//  ViewController.swift
//  Drawing
//
//  Created by Magdalena Toczek on 12/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


class ShapesWithShapeLayer: UIViewController {

    @IBOutlet weak var shapesView: UIView!
    var squareLayer = CAShapeLayer()
    var circleLayer = CAShapeLayer()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSquare()
        createCircle()
        
        combinePath()
    }


    
    func combinePath(){
        let combineShape = CAShapeLayer()
        
        let combinePath = UIBezierPath()
        
        let circle1  = UIBezierPath(ovalIn: CGRect(x: 250, y: 120, width: 60, height: 60))
        let circle2 = UIBezierPath(ovalIn: CGRect(x: 250, y: 160, width: 40, height: 40))
        
        combinePath.append(circle1)
        combinePath.append(circle2)
        
        combineShape.path = combinePath.cgPath
        combineShape.strokeColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        combineShape.lineWidth = 3.0
        shapesView.layer.addSublayer(combineShape)
        
    }
    
    
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        squareLayer.path = UIBezierPath(rect: CGRect(x: 20, y: 20, width: 200, height: 100)).cgPath
        circleLayer.path = UIBezierPath(ovalIn: CGRect(x: 40, y: 130, width: 80, height: 80)).cgPath
        

    }
    
    
    func createSquare(){
        squareLayer.fillColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        shapesView.layer.addSublayer(squareLayer)
        
    }
    
    func createCircle(){
        circleLayer.fillColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        circleLayer.strokeColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        circleLayer.lineWidth = 4.0
        shapesView.layer.addSublayer(circleLayer)
    }
    
    
    
}

