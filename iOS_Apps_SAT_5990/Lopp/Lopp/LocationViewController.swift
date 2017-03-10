//
//  LocationViewController.swift
//  
//
//  Created by Lanka on 25/06/16.
//
//

import UIKit
import MapKit
import CoreLocation
import Firebase

class LocationViewController: UIViewController,CLLocationManagerDelegate, MKMapViewDelegate{

    @IBOutlet weak var address: UILabel!
  
    @IBOutlet weak var mapView: MKMapView!
    
    @IBOutlet weak var destination: UITextField!
    
   
    
    @IBAction func Lopp(sender: AnyObject) {
        
        
        
        
        
    }
    
    let rootRef = FIRDatabase.database().referenceFromURL("https://lopp-2e6c8.firebaseio.com")
    
    var destinationsRef: FIRDatabaseReference!
    var destref = FIRDatabase.database().reference().child("Chicago")

    
    
    var locationmanager:CLLocationManager!
    var previousAddress: String!
    var geoCoder :CLGeocoder!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationmanager = CLLocationManager()
        locationmanager.desiredAccuracy = kCLLocationAccuracyBest
        locationmanager.delegate = self
        locationmanager.requestAlwaysAuthorization()
        locationmanager.requestLocation()
        geoCoder = CLGeocoder()
        self.mapView.delegate = self
        
        destinationsRef = rootRef.child("destinations")

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location: CLLocation = locations.first!
        self.mapView.centerCoordinate = location.coordinate
        //let reg = MKCoordinateRegionMakeWithDistance(location.coordinate, 150, 150)
        let reg = MKCoordinateRegionMakeWithDistance(location.coordinate, 1500, 1500)
            self.mapView.setRegion(reg, animated: true)
            geoCode(location)
    }
    
    func geoCode(location:CLLocation){
        
        geoCoder.cancelGeocode()
        geoCoder.reverseGeocodeLocation(location) { (data, error)->Void in
            guard let placemarks = data as [CLPlacemark]! else {return}
            
            let loc: CLPlacemark = placemarks[0]
            let addressDict: [NSString:NSObject] = loc.addressDictionary as! [NSString: NSObject]
            let addrList = addressDict["FormattedAddressLines"] as! [String]
            let address = addrList.joinWithSeparator(" ,")
            print(address)
            self.address.text = address
            self.previousAddress = address
        }
        
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
    print(error)
    
    }
    
    func mapView(mapView: MKMapView, regionDidChangeAnimated animated: Bool){
        
        let location = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        geoCode(location)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        guard let navController = segue.destinationViewController as? UINavigationController,
            let chatController = navController.viewControllers.first as? ChatViewController else { return }
        
        chatController.senderId = FIRAuth.auth()?.currentUser?.uid
        chatController.senderDisplayName = FIRAuth.auth()?.currentUser?.displayName ?? ""
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
 
    
 
    @IBAction func addDestination(sender: AnyObject) {
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        //var destref = //rootRef.child(destination.text!)
       // destref.observeEventType(.Value){
        //(snap: FIRDataSnapshot) in

        //}
    }

  

}
