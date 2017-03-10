//
//  OnePageView.swift
//  Wonderland
//
//  Created by Lanka on 18/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation

import UIKit
class OnePageView: UIView {
    var text: NSString = "" { didSet { setNeedsDisplay() } }
    var fontAttrs: [String: AnyObject]! = nil
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        text.drawInRect(bounds, withAttributes: fontAttrs)
    }
}
