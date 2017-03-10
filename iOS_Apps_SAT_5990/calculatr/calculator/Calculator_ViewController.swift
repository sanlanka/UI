//
//  ViewController.swift
//  calculator
//
//  Created by Lanka on 13/05/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit

class Calculator_ViewController: UIViewController {
    
    var opd: Double = 0.0
    var stack_OP = ("","","")

    @IBOutlet weak var Display: UILabel!
 
    @IBAction func Get_Number(sender: UIButton){
        //if(sender.currentTitle == ".") || (Double(sender.currentTitle!) != nil)
        switch sender.currentTitle!
        {
            case ".","0","1","2","3","4","5","6","7","8","9":
            if(stack_OP.1 == "")
            {
            stack_OP.0 = stack_OP.0 + sender.currentTitle!
            Display.text = stack_OP.0
            }
            else
            {
                stack_OP.2 = stack_OP.2 + sender.currentTitle!
                Display.text = stack_OP.2
                
            }
        
        //else if(sender.currentTitle == "+/-")
         case "+/-":
        
            if(stack_OP.1 == "")
            {
                if(!stack_OP.0.hasPrefix("-"))
                {
                stack_OP.0 = "-" + stack_OP.0
                Display.text = stack_OP.0
                }
                else
                {
                    stack_OP.0.removeAtIndex(stack_OP.0.startIndex)
                    Display.text = stack_OP.0
                }
            }
            else
            {
                
                if(!stack_OP.2.hasPrefix("-"))
                {
                    stack_OP.2 = "-" + stack_OP.2
                    Display.text = stack_OP.2
                }
                else
                {
                    stack_OP.2.removeAtIndex(stack_OP.2.startIndex)
                    Display.text = stack_OP.2
                }
            }
        
       // else if(sender.currentTitle == "AC"){
           case "AC":
            stack_OP = ("","","")
            Display.text = "0"
           case "+","-","÷","×":
        //else if (sender.currentTitle == "+" || sender.currentTitle == "-" || sender.currentTitle == "÷" || sender.currentTitle == "×")
        
            if(stack_OP.1 == "")
            {
            stack_OP.1 = sender.currentTitle!
            }
            else if (stack_OP.0 != "") && (stack_OP.1 != "")&&(stack_OP.2 != "")
            {
            //stack_OP.0 = String(Operation(stack_OP.0,op:stack_OP.1,opd2:stack_OP.2))
            
            switch stack_OP.1
            {
            case "+":
                stack_OP.0 = String(Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!+Double($1)!)
                    })
            case "-":
                stack_OP.0 = String(Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!-Double($1)!)
                })
            case "×":
                stack_OP.0 = String(Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!*Double($1)!)
                })
            case "÷":
                stack_OP.0 = String(Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!/Double($1)!)
                })
            default:break
            stack_OP.1 = sender.currentTitle!
            stack_OP.2 = ""
            Display.text = stack_OP.0
            }
            }
        
        //else if(sender.currentTitle == "=") && (stack_OP.0 != "") && (stack_OP.1 != "")&&(stack_OP.2 != ""){
          case "=" where (stack_OP.0 != "") && (stack_OP.1 != "")&&(stack_OP.2 != ""):
            var result : Double = 0
            //result = Operation(stack_OP.0,op:stack_OP.1,opd2:stack_OP.2)
            
            switch stack_OP.1            {
            case "+":
                result = Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!+Double($1)!)
                }
            case "-":
                result = Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!-Double($1)!)
                }
            case "×":
                result = Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!*Double($1)!)
                }
            case "÷":
                result = Operation(stack_OP.0,opd2:stack_OP.2){
                    //(opd1:String,opd2:String)->Double in
                    return(Double($0)!/Double($1)!)
                }
            default:break
                
                stack_OP.1 = sender.currentTitle!
                stack_OP.2 = ""
                Display.text = stack_OP.0
            }

            Display.text = String(result)
            stack_OP.0 = String(result)
            stack_OP.1 = ""
            stack_OP.2 = ""
          case "%":
        //else if(sender.currentTitle == "%")
        
            if (stack_OP.1 == "")
            {
                stack_OP.0 = String(Double(stack_OP.0)! / 100)
                Display.text = stack_OP.0
            }
            else
            {
                stack_OP.2 = String(Double(stack_OP.2)! / 100)
                Display.text = stack_OP.2

            }
        default:break

        }
    }
    func Operation(opd1:String,opd2:String,mathfunction:(String,String)->Double) -> Double
    {
       return(mathfunction(opd1,opd2))

    }
    func add(opd1: String,opd2: String)->Double
    {
      return(Double(opd1)!+Double(opd2)!)
        
    }
    func subtract(opd1: String,opd2: String)->Double
    {
        return(Double(opd1)!-Double(opd2)!)
        
    }
    func multiply(opd1: String,opd2: String)->Double
    {
        return(Double(opd1)!*Double(opd2)!)
        
    }
    func divide(opd1: String,opd2: String)->Double
    {
        return(Double(opd1)!/Double(opd2)!)
        
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

