//
//  OnePageViewController.swift
//  Wonderland
//
//  Created by Lanka on 18/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation

import UIKit
class OnePageViewController: UIViewController {
    @IBOutlet var textView: OnePageView!
    @IBOutlet var pageLabel: UILabel!
    
    var pageNumber = 1
    var paginator: Paginator? = nil
    func loadPageContent() {
        if let tv = textView {
            if let pager = paginator {
                pager.viewSize = tv.bounds.size
                if !pager.pageAvailable(pageNumber) {
                    pageNumber = pager.lastKnownPage
                }
                tv.fontAttrs = pager.fontAttrs
                tv.text = pager.textForPage(pageNumber)
            }
        }
        pageLabel?.text = "Page \(pageNumber)"
}
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        loadPageContent()
    }
}