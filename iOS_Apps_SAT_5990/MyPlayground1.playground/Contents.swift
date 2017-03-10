//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"
var s = "Balcck sheep"

struct Point{
 var x = 0.0 ,y = 0.0
     mutating func moveByX(deltaX:Double,y deltaY:Double){
        x+=deltaX
        y+=deltaY
}
}
var somepoint = Point(x:10,y:10)
somepoint.moveByX(1.0, y: 1.0)
somepoint.moveByX(2.0, y: 3.0)
print ("The point is now at (\(somepoint.x),\(somepoint.y)")

struct Resolution{
    var width = 0
    var height = 0
}

class Videomode{
    
    var resolution = Resolution()
    var interlaced = false
    var framerate = 0.0
    var name:String = ""
}

let someresolution = Resolution()
let someVideomode = Videomode()