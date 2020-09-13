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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createSquare()
    }


    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        squareLayer.path = UIBezierPath(rect: CGRect(x: 20, y: 20, width: 200, height: 100)).cgPath
        
        

    }
    
    
    func createSquare(){
        squareLayer.fillColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        shapesView.layer.addSublayer(squareLayer)
        
    }
    
    
    
}

