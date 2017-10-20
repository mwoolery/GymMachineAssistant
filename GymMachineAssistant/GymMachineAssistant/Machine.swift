//
//  Machine.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/20/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import Foundation



class Machine{
    
    var name:String
    var muscleGroupWorked:[MuscleGroup]
    //location number if we decide to change from QR to numbering system.
    var location: Int
    // Use a means of QR code association if we go this route
    //var QRCode:
    // machineType would either be cardio or weight depending on machines intended purpose
    var machineType:String
    
    init(name:String, muscleGroupWorked:[MuscleGroup], location:Int, machineType:String){
        self.name = name
        self.muscleGroupWorked = muscleGroupWorked
        self.location = location
        self.machineType = machineType
        
    }
    // use this to get a picture name for machine
    func getPictureString(name:String)->String{
        return "\(name).jpg"
    }
    // use this to get a video to demonstrate how this machine would work, may or may not be added.
    func getVideoString(name:String)->String{
        return "\(name).mov"
    }
    
    
}
