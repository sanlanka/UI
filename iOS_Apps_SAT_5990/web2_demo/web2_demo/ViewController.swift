//
//  ViewController.swift
//  web2_demo
//
//  Created by Lanka on 11/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIWebViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBOutlet weak var urlfeild: UITextField!
    @IBOutlet weak var webview: UIWebView!
    @IBAction func LoadLocation(sender: UITextField) {
        let webaddress = urlfeild.text
        let url = NSURL(string:webaddress!)
        let urlrequest = NSURLRequest(URL: url!)
        webview.loadRequest(urlrequest)
        
    }
}

