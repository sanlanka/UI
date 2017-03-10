//
//  BookDataSource.swift
//  Wonderland
//
//  Created by Lanka on 18/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation
import UIKit
class BookDataSource: NSObject, UIPageViewControllerDataSource {
    
    let paginator = Paginator(font: UIFont(name: "Times New Roman", size: 18.0)!)
    func load( page: Int, pageViewController: UIPageViewController)
        -> OnePageViewController? {
            if page < 1 || !paginator.pageAvailable(page){
                return nil;
            }
            let controller = pageViewController.storyboard?.instantiateViewControllerWithIdentifier("OnePage") as! OnePageViewController
            controller.paginator = paginator
            controller.pageNumber = page
            return controller
    }
    
    func pageViewController(bookViewController: UIPageViewController,  viewControllerAfterViewController viewController: UIViewController)
        -> UIViewController? {
            if let pageController = viewController as? OnePageViewController {
                let pageAfter = pageController.pageNumber + 1
                return load(pageAfter, pageViewController: bookViewController)
            }
            return nil }
    
    func pageViewController(bookViewController: UIPageViewController,  viewControllerBeforeViewController viewController: UIViewController)
        -> UIViewController? {
            if let pageController = viewController as? OnePageViewController {
                let pageBefore = pageController.pageNumber - 1
                return load(pageBefore, pageViewController: bookViewController)
            }
            return nil }
    
    
    
    }

