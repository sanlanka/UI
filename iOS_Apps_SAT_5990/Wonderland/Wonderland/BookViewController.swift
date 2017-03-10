//
//  BookViewController.swift
//  Wonderland
//
//  Created by Lanka on 18/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit
import Foundation

class BookViewController: UIPageViewController {
    
    
let bookSource = BookDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let textURL = NSBundle.mainBundle().URLForResource( "Alice",
                                                               withExtension: "txt") {
           //bookSource.paginator.bookText = NSString(contentsOfURL:textURL,
             //                                       encoding:NSUTF8StringEncoding, error:nil)
            
            //    UIApplication.sharedApplication().openURL(textURL)
            
            //bookSource.paginator.bookText = String(ContentsOfURL:textURL,encoding:NSUTF8StringEncoding,error:nil)
            do {
                let text2 = try NSString(contentsOfURL: textURL, encoding: NSUTF8StringEncoding)
                bookSource.paginator.bookText = text2
            }
            catch {/* error handling here */}
        }
        


        dataSource = bookSource
        let firstPage = bookSource.load(1, pageViewController: self)!
        setViewControllers( [firstPage],
    direction: .Forward,
    animated: false,
    completion: nil)
}
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        adaptViewsToTraitCollection(traitCollection)
    }
    
    override func willTransitionToTraitCollection(newCollection: UITraitCollection, withTransitionCoordinator coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransitionToTraitCollection(newCollection, withTransitionCoordinator: coordinator)
        adaptViewsToTraitCollection(newCollection)
    }
    
    func adaptViewsToTraitCollection(traits: UITraitCollection) {
        let compactWidth = ( traitCollection.horizontalSizeClass == .Compact )
        
        var fontSize: CGFloat = 18.0		// font size for regular width displays
        if compactWidth {
            fontSize = 14.0					// font size for compact width displays
        }
        let paginator = bookSource.paginator
        let currentFont = paginator.font
        if currentFont.pointSize != fontSize {
            paginator.font = currentFont.fontWithSize(fontSize)
        }
    }
    
    

}