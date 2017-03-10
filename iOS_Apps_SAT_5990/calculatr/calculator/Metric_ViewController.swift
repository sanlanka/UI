//
//  Metric_ViewController.swift
//  calculator
//
//  Created by Lanka on 25/05/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit
class Metric_ViewController: UIViewController {
    enum ConversionType{
        case Temperature(String)
        case Weight(String)
        case Distance(String)
    }

    @IBOutlet weak var F: UITextField!


    @IBOutlet weak var C: UITextField!

    @IBOutlet weak var Kg: UITextField!

    @IBOutlet weak var lb: UITextField!
    
    @IBOutlet weak var Km: UITextField!
    
    @IBOutlet weak var Mi: UITextField!
    
override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
}

override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
}
    @IBAction func Metric_Conversion(sender: UITextField) {
        var num:Double = 0
        var converted_num:Double = 0
        var CType: ConversionType = .Temperature("F")
        CType = ConversionType.Temperature(sender.restorationIdentifier!)
        var WType: ConversionType = .Weight("Kg")
        WType = ConversionType.Weight(sender.restorationIdentifier!)
        var DType: ConversionType = .Distance("Km")
        DType = ConversionType.Distance(sender.restorationIdentifier!)

        // Temperature Conversion
        switch CType
        {
        case .Temperature("F"):
            if let num1 = Double(F.text!){
                num = num1
                converted_num = (num-32)*5.0/9.0
                C.text = String(converted_num)
            }
            else{
                C.text = ""
            }
        case .Temperature("C"):
            if let num1 = Double(C.text!){
                num = num1
                converted_num = num*9.0/5.0 + 32
                F.text = String(converted_num)
            }
            else
            {
                F.text = ""
            }
            default:break
        }
        //Weight Conversion
        switch WType
        {
        case .Weight("Kg"):
            if let num1 = Double(Kg.text!){
                num = num1
                converted_num = (num/0.45359237)
                lb.text = String(converted_num)
            }
            else{
                lb.text = ""
            }
        case .Weight("lb"):
            if let num1 = Double(lb.text!){
                num = num1
                converted_num = num*0.45359237
                Kg.text = String(converted_num)
            }
            else
            {
                Kg.text = ""
            }
        default:break
        }
        //Distance Conversion
        switch DType
        {
        case .Distance("Km"):
            if let num1 = Double(Km.text!){
                num = num1
                converted_num = (num*0.62137)
                Mi.text = String(converted_num)
            }
            else{
                Mi.text = ""
            }
        case .Distance("Mi"):
            if let num1 = Double(Mi.text!){
                num = num1
                converted_num = num/0.62137
                Km.text = String(converted_num)
            }
            else
            {
                Km.text = ""
            }
        default:break
        }


    }
}