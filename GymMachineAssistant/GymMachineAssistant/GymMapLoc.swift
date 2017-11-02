//
//  GymMapLoc.swift
//  GymMachineAssistant
//
//  Created by Kalvakota,Vaishnavi on 11/2/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import MapKit

class GymMapLoc:  NSObject, MKAnnotation{
    
    var name: String?
    var subName: String?
    var coordinate: CLLocationCoordinate2D
    
    init(name:String, subName: String, coordinate: CLLocationCoordinate2D) {
        self.name = name
        self.subName = subName
        self.coordinate = coordinate
    }
}
