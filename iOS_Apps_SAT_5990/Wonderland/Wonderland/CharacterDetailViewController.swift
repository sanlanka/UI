//
//  CharacterDetailViewController.swift
//  Wonderland
//
//  Created by Lanka on 18/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import Foundation
import UIKit

class CharacterDetailViewController: UIViewController {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var descriptionView: UITextView!
    
    
    var characterInfo = [String: String]()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        nameLabel?.text = characterInfo[nameKey]
        imageView?.image = UIImage(named: characterInfo[imageKey]!)
        descriptionView?.text = characterInfo[descriptionKey]
    }

}