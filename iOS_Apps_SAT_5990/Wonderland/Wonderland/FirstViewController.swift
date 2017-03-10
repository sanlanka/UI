//
//  FirstViewController.swift
//  Wonderland
//
//  Created by Lanka on 17/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UIAdaptivePresentationControllerDelegate {

    @IBAction func dismissInfo(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if segue.identifier == "info" {
            let presented = segue.destinationViewController as UIViewController
            let presentationController = presented.presentationController
            presentationController?.delegate = self
        } else {
            super.prepareForSegue(segue, sender: sender)
        } }

    func adaptivePresentationStyleForPresentationController(
        controller: UIPresentationController) -> UIModalPresentationStyle {
        return .FullScreen
    }
    
    func presentationController(controller: UIPresentationController,  viewControllerForAdaptivePresentationStyle style:
        UIModalPresentationStyle) -> UIViewController? {
        let presentedVC = controller.presentedViewController
        let replacementController
            = UINavigationController(rootViewController: presentedVC)
        let navigationItem = presentedVC.navigationItem
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done,
                                         target: self,
                                         action: "dismissInfo:")
        navigationItem.rightBarButtonItem = doneButton
        navigationItem.title = "Author"
        return replacementController
    }
    

}

