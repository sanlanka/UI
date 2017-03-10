//
//  Apartment.swift
//  tb1
//
//  Created by Lanka on 11/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation
import UIKit
let notificationchanged = "Apartment Information Changed"
class Apartment{
    func Apartmentinformationchanged(){
        let center = NSNotificationCenter.defaultCenter()
        center.postNotificationName(notificationchanged, object: self)
    }
    
    var unit:String{
    didSet{
        Apartmentinformationchanged()
    }
    }
    var location:String{
    didSet{
        Apartmentinformationchanged()
    }
    }
    var image:UIImage?{
        didSet{
            Apartmentinformationchanged()
        }
        
    }
    
    var viewimage:UIImage
    {
        return image ?? UIImage(named: "camera")!
        
    }
    init(unit: String, location: String){
        self.unit = unit
        self.location = location
    }
    var tenant:Person?{
    didSet{
        Apartmentinformationchanged()
    }
    }
}

class Person{
    var name: String
    var Student_ID: String
    init(name: String, Student_ID: String){
        self.name = name
        self.Student_ID = Student_ID
    }
    weak var apartment:Apartment?
    
}