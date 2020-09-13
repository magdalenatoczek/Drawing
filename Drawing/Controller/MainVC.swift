//
//  ViewController.swift
//  Drawing
//
//  Created by Magdalena Toczek on 12/09/2020.
//  Copyright © 2020 Popeq Apps. All rights reserved.
//

import UIKit


class MainVC: UIViewController {


    @IBOutlet weak var ringGraphView: RingGraph!
    
    @IBOutlet weak var slider: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
 
    }
    
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        print (sender.value)
        
        ringGraphView.changeTheStrokeEnd(newValueFromSlider: CGFloat(sender.value))
        
    }
    
    
    

}

