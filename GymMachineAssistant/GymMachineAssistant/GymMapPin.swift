//
//  GymMapPin.swift
//  GymMachineAssistant
//
//  Created by Kalvakota,Vaishnavi on 11/2/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import MapKit
// This is used to make pin annotations
class GymMapPin:  NSObject, MKAnnotation{
    
    var title: String?
    var subtitle: String?
    var coordinate: CLLocationCoordinate2D
    
    init(title:String, subtitle: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.subtitle = subtitle
        self.coordinate = coordinate
    }
}
