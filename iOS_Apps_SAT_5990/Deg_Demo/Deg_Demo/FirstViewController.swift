//
//  ViewController.swift
//  Deg_Demo
//
//  Created by Lanka on 11/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, Get_Image_Name {
    var ImageName:String = ""
    var ImgName: String = ""
    @IBOutlet weak var Image_Entered: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let DC = segue.destinationViewController as! SecondViewController
        DC.deg = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func Display_Image(sender: UIButton) {
        
        ImageName = Image_Entered.text!
    }

}

