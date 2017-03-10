//
//  ViewController.swift
//  first
//
//  Created by Lanka on 12/05/16.
//  Copyright © 2016 Lanka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let pi = 3.1415925
    var radius :Double = 0.0
    var area:Double = 0
    
    @IBOutlet weak var Radius_value: UITextField!
    
    @IBOutlet weak var Display_output: UITextField!
    
    @IBAction func Compute_Area(sender: UIButton) {
        if let radius1 = Double(Radius_value.text!){
            radius = radius1
        radius = Double(Radius_value.text!)!
        area = pi * radius * radius
        Display_output.text = String(area)
        //print("The area is \(area)")
        }
        else{
            Display_output.text = "Enter a valid radius not Text"
            
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

