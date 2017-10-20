//
//  Gym.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/20/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import Foundation


struct Gym{
    var name:String
    var location: String
    //use this for the gym machines navigation
    //name:String, muscleGroupWorked:[MuscleGroup], location:Int, machineType:String
    static var machineList:[Machine] = [Machine("Chest Fly",["Chest"], 1, "Weight"), Machine("Bench Press",["Chest", "Tricep"], 2, "Weight"), Machine("Treadmill",["Cardiovascular"], 3, "Cardio"), Machine("Lateral Pull-Down",["Back", "Bicep"], 4, "Weight")]
    
    
}
