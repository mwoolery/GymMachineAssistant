//
//  CoreDataModel.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 11/16/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//


import Foundation
import UIKit
import CoreData

class CoreDataModel {
    
    static func doCoreData(){
        let moc = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext
        
        let gym0 = NSEntityDescription.insertNewObject(forEntityName: "Gym",into: moc) as! Gym

        gym0.name = "Foster Fitness Center"
        gym0.latitude = 40.3505584
        gym0.longitude = -94.88488749999999
        
        let gym1 = NSEntityDescription.insertNewObject(forEntityName: "Gym",into: moc) as! Gym
        gym1.name = "Title Town Gym"
        
        gym1.latitude = 40.331034
        gym1.longitude = -94.874796
        
        
        let machine00 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        // use name for video string and image string
        machine00.name = "Chest Fly"
        //Description is new to our entities Use this to add in a description field on machine view controller
        machine00.desc = "Chest Fly Description"
        machine00.machineType = "Weight"
        machine00.location = 1
        machine00.muscleGroupWorked = "Chest"
        machine00.gym = gym0
        
        let machine01 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine01.name = "Bench Press"
        machine01.desc = "Bench Press Description"
        machine01.machineType = "Weight"
        machine01.location = 2
        machine01.muscleGroupWorked = "Chest, Tricep"
        machine01.gym = gym0
        
        let machine02 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine02.name = "Treadmill"
        machine02.desc = "Treadmill Description"
        machine02.machineType = "Cardiovascular"
        machine02.location = 3
        machine02.muscleGroupWorked = "Cardio"
        machine02.gym = gym0
        
        let machine03 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine03.name = "Lateral Pull-Down"
        machine03.desc = "Lateral Pull-Down Description"
        machine03.machineType = "Weight"
        machine03.location = 4
        machine03.muscleGroupWorked = "Back, Bicep"
        machine03.gym = gym0
        
        let machine04 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine04.name = "Smith Machine"
        machine04.desc = "Smith Machine Description"
        machine04.machineType = "Weight"
        machine04.location = 5
        machine04.muscleGroupWorked = "Shoulders"
        machine04.gym = gym0
        
        let machine05 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine05.name = "Suspension Trainer"
        machine05.desc = "Chest"
        machine05.machineType = "Weight"
        machine05.location = 6
        machine05.muscleGroupWorked = "Full Body Workout"
        machine05.gym = gym0
        
        let machine06 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine06.name = "The Roman Chair"
        machine06.desc = "The Roman Chair Description"
        machine06.machineType = "Weight"
        machine06.location = 7
        machine06.muscleGroupWorked = "Back, Core, Abdominals, Hamstrings, Abs"
        machine06.gym = gym0
        
        let machine07 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine07.name = "Cross Trainer"
        machine07.desc = "Cross Trainer Description"
        machine07.machineType = "Cardio"
        machine07.location = 8
        machine07.muscleGroupWorked = "Legs, Cardio"
        machine07.gym = gym0
        
        let machine08 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine08.name = "Stationary Bike"
        machine08.desc = "Stationary Bike Description"
        machine08.machineType = "Cardiovascular"
        machine08.location = 9
        machine08.muscleGroupWorked = "Cardio, Legs"
        machine08.gym = gym0
        
        let machine09 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine09.name = "Rowing Machine"
        machine09.desc = "Rowing Machine Description"
        machine09.machineType = "Weight"
        machine09.location = 10
        machine09.muscleGroupWorked = "Back, Bicep"
        machine09.gym = gym0

      


        do {
            try moc.save()
            print("Success, I guess ...")
        } catch {
            print("Error when trying to save: \(error)")
        }
        
    }
    // For Machine VC
    static func fetchAllItems() ->[Machine]{
        let moc = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext
       var machines = [Machine]()
        do {
            let fetchRequest:NSFetchRequest<Machine> = NSFetchRequest(entityName: "Machine")
            machines =
                try moc.fetch(fetchRequest)
            for _ in machines {
                //print(post.title!, post.content!, post.blog?.name! ?? "No Name")
            }
        } catch {
            print("Error when trying to fetch: \(error)")
        }
        return machines
    }
    
    // For Map VC
    static func fetchAllGyms() ->[Gym]{
        let moc = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext
        var gyms = [Gym]()
        do {
            let fetchRequest:NSFetchRequest<Gym> = NSFetchRequest(entityName: "Gym")
            gyms =
                try moc.fetch(fetchRequest)
            for _ in gyms {
                //print(post.title!, post.content!, post.blog?.name! ?? "No Name")
            }
        } catch {
            print("Error when trying to fetch: \(error)")
        }
        return gyms
    }
    
    
    static func fetchSomeItems(){
        
        var gyms:[Gym]!
        let moc = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext

        let fetchRequest:NSFetchRequest<Gym> = NSFetchRequest(entityName: "Gym")
        fetchRequest.predicate = NSPredicate(format:"name contains %@ ","Foster")
        do {
            gyms = try moc.fetch(fetchRequest)

            for gym in gyms {
                print("Gym:  \(String(describing: gym.name))")

                for machine in gym.machines!{
                    print("Name: \((machine as! Machine).name!), \nContent \((machine as! Machine).location)")
                }
            }
        } catch {
            print("Error when trying to fetch: \(error)")
        }
        
    }
    
    static func fetchWithCompoundPredicates(){
        var gyms:[Gym]!
        let moc = (UIApplication.shared.delegate as!
            AppDelegate).persistentContainer.viewContext

        let fetchRequest:NSFetchRequest<Gym> = NSFetchRequest(entityName: "Gym")

        let includesFirst = NSPredicate(format:"name contains %@ ","Foster")
        let endsWithGym = NSPredicate(format:"name endsWith %@", "Gym")

        fetchRequest.predicate = NSCompoundPredicate(type:.and, subpredicates: [includesFirst, endsWithGym] )
        do {
            gyms = try moc.fetch(fetchRequest)

            for gym in gyms {
                print("Gym:  \(String(describing: gym.name))")

                for machine in gym.machines!{
                    print("Name: \((machine as! Machine).name!), \nContent \((machine as! Machine).location)")
                }
            }
        } catch {
            print("Error when trying to fetch: \(error)")
        }

}
}
