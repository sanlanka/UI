//
//  DetailViewController.swift
//  tb1
//
//  Created by Lanka on 11/06/16.
//  Copyright © 2016 MTU. All rights reserved.
//

import UIKit
import MobileCoreServices

class DetailViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    func presentImagePicker(source: UIImagePickerControllerSourceType){
        
        let picker = UIImagePickerController()
        picker.sourceType = source
        picker.mediaTypes = [ kUTTypeImage as String]
        picker.delegate = self
        presentViewController(picker,animated: true,completion:nil)

        
    }


    @IBOutlet weak var UnitView: UITextField!
    
    @IBOutlet weak var LocationView: UITextField!
    
    @IBOutlet weak var TenantView: UITextField!
    
    @IBOutlet weak var Student_IDView: UITextField!
    
    @IBOutlet weak var detailDescriptionLabel: UILabel!
    
    @IBOutlet weak var ImageView: UIImageView!
    
    @IBAction func ChoosePicture(sender: AnyObject) {
        if detailItem == nil{return}
        let hasphotos = UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)
        let hascamera = UIImagePickerController.isSourceTypeAvailable(.Camera)
        if (hasphotos == true)
        {
            presentImagePicker(.PhotoLibrary)
            
        }
        else if (hascamera == true)
        {
            
            presentImagePicker(.Camera)
            
        }
        
    }
    @IBAction func ChangedCell(sender: AnyObject) {
        
        if(sender as! NSObject == UnitView)
        {
           detailItem?.unit = UnitView.text!
        }
        else if(sender as! NSObject == LocationView)
        {
            detailItem?.location = LocationView.text!
        }
        else if(sender as! NSObject == TenantView)
        {
            detailItem?.tenant?.name = TenantView.text!
        }
        else if(sender as! NSObject == Student_IDView)
        {
            detailItem?.tenant?.Student_ID = Student_IDView.text!
        }
    }

    
    var detailItem: Apartment? {
        didSet {
            // Update the view.
            self.configureView()
        }
    }
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.detailItem {
            if let view = self.UnitView{
                UnitView.text = detail.unit
            }
            if let view = self.LocationView{
            LocationView.text = detail.location
            }
            if let view = self.TenantView{
            TenantView.text = detail.tenant?.name
            }
            if let view = self.Student_IDView{
            Student_IDView.text = detail.tenant?.Student_ID
            }
            if let view = self.ImageView{
                
                ImageView.image = detail.viewimage
            }
            
            
                }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.configureView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]){
        
        var image: UIImage! = info[UIImagePickerControllerEditedImage] as? UIImage
        
        if image == nil{
            image = info[UIImagePickerControllerOriginalImage] as! UIImage
        }
        detailItem?.image = image
        ImageView.image = image
        dismissViewControllerAnimated(true, completion: nil)
        }
}

