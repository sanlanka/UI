//
//  SecondViewController.swift
//  Deg_Demo
//
//  Created by Lanka on 11/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//
protocol Get_Image_Name{
    var ImgName: String{get}
}
import Foundation
import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var Image_View: UIImageView!
    var deg: Get_Image_Name?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let Image = UIImage(named: deg!.ImgName)
        Image_View.image = Image
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

