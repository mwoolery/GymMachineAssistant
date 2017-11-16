//
//  MapViewController.swift
//  GymMachineAssistant
//
//  Created by Kalvakota,Vaishnavi on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit
import MapKit
class MapViewController: UIViewController {
    
    
    @IBOutlet weak var mapView: MKMapView!
    
    @IBAction func goToPin(_ sender: Any) {
        
        self.performSegue(withIdentifier: "gymViewSegue", sender: self)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //CoreDataModel.doCoreData()
        let myGyms = CoreDataModel.fetchAllGyms()
        let distance:CLLocationDegrees = 2000
        //CLLocationCoordinate2D(latitude: 40, longitude: 40)
        for i in myGyms{
        let gymMapLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(i.latitude, i.longitude)
        mapView.setRegion(MKCoordinateRegionMakeWithDistance(gymMapLocation, distance, distance), animated: true)
        
            let gymPinLoc = GymMapLoc(title: i.name!, subtitle: i.name!, coordinate: gymMapLocation)
        mapView.addAnnotation(gymPinLoc)
    }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
