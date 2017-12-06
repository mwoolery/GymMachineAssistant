//
//  MapViewController.swift
//  GymMachineAssistant
//
//  Created by Kalvakota,Vaishnavi on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

// map view set up and annotation from example on https://stackoverflow.com/questions/30793315/customize-mkannotation-callout-view

class MapViewController: UIViewController , MKMapViewDelegate{
    
    @IBOutlet weak var mapView: MKMapView!

    override func viewDidLoad() {
        super.viewDidLoad()
        //CoreDataModel.doCoreData()
        let myGyms = CoreDataModel.fetchAllGyms()
        let distance:CLLocationDegrees = 5000
        //CLLocationCoordinate2D(latitude: 40, longitude: 40)
        for i in myGyms{
            // set the location to the gym being added
            let gymMapLocation:CLLocationCoordinate2D = CLLocationCoordinate2DMake(i.latitude, i.longitude)
            mapView.setRegion(MKCoordinateRegionMakeWithDistance(gymMapLocation, distance, distance), animated: true)
            //set the pin locations
            let gymPinLoc = GymMapLoc(title: i.name!, subtitle: i.name!, coordinate: gymMapLocation)
            //add the annotation
            mapView.addAnnotation(gymPinLoc)
        }
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Setting up the map view, this is from the stack overflow thread
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation {
            return nil
        }
        
        let identifier = "MyCustomAnnotation"
        
        var annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
        if annotationView == nil {
            annotationView = MKPinAnnotationView(annotation: annotation, reuseIdentifier: identifier)
            annotationView?.canShowCallout = true
        } else {
            annotationView!.annotation = annotation
        }
        
        configureDetailView(annotationView: annotationView!)
        
        return annotationView
    }
    
    // this configures the view that is displayed when a pin is tapped, this was retrieved from the stack overflow thread and we updated it a bit to better suit our needs
    func configureDetailView(annotationView: MKAnnotationView) {
        let width = 300
        let height = 200
        
        let snapshotView = UIView()
        //make the view programmatically, have to do this since we won't be able to make a view for every one in storyboard
        let views = ["snapshotView": snapshotView]
        snapshotView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:[snapshotView(300)]", options: [], metrics: nil, views: views))
        snapshotView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:[snapshotView(200)]", options: [], metrics: nil, views: views))
        
        // options is used to set the view's image from maps
        let options = MKMapSnapshotOptions()
        options.size = CGSize(width: width, height: height)
        options.mapType = .satelliteFlyover
        options.camera = MKMapCamera(lookingAtCenter: annotationView.annotation!.coordinate, fromDistance: 250, pitch: 55, heading: 0)
        //get the image from maps by taking a snapshot of the satelliteFlyover view
        let snapshotter = MKMapSnapshotter(options: options)
        snapshotter.start { snapshot, error in
            if snapshot != nil {
                let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
                imageView.image = snapshot!.image
                snapshotView.addSubview(imageView)
            }
        }
        //setting the callout to the snapshot that was just made
        annotationView.detailCalloutAccessoryView = snapshotView
    }
    
    
    
    
}
