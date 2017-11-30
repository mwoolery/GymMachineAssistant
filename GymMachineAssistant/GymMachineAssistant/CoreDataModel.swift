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
        machine00.desc = """
        The chest fly is similar to a chest press in that you lie on an exercise bench with your knees bent up on the bench. With the fly you start by holding light dumbbells straight up in the air, palms facing together.
        Be careful not to let your shoulders or elbows drop lower than the exercise bench.
        """
        machine00.machineType = "Weight"
        machine00.location = 1
        machine00.muscleGroupWorked = "Chest"
        machine00.gym = gym0
        
        let machine01 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine01.name = "Bench Press"
        machine01.desc = """
        The bench press is an upper body strength training exercise that consists of pressing a weight upwards from
        supine position. The exercise works the pectoralis major as well as supporting chest, arm, and shoulder
        muscles such as the anterior deltoids, serratus anterior, coracobrachialis, scapulae fixers, trapezii,
        and the triceps.
        Lie back on a flat bench. Using a medium width grip (a grip that creates a 90-degree angle in the middle of the movement between the forearms and the upper arms),
        lift the bar from the rack and hold it straight over you with your arms locked. This will be your starting position.
        """
        machine01.machineType = "Weight"
        machine01.location = 2
        machine01.muscleGroupWorked = "Chest, Tricep"
        machine01.gym = gym0
        
        let machine02 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine02.name = "Treadmill"
        machine02.desc = """
        A treadmill is a device generally for walking or running or climbing while staying in the same place.
        The belt moves to the rear, requiring the user to walk or run at a speed matching that of the belt. The rate at which the belt moves is the rate of walking or running. Thus, the speed of running may be controlled and measured. The more expensive, heavy-duty versions are motor-driven (usually by an electric motor). The simpler, lighter, and less expensive versions passively resist the motion, moving only when walkers push the belt with their feet. The latter are known as manual treadmills.
        """
        machine02.machineType = "Cardiovascular"
        machine02.location = 3
        machine02.muscleGroupWorked = "Cardio"
        machine02.gym = gym0
        
        let machine03 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine03.name = "Lateral Pull-Down"
        machine03.desc = """
        Sit down on a pull-down machine with a wide bar attached to the top pulley. Make sure that you adjust the knee pad of the machine to fit your height. These pads will prevent your body from being raised by the resistance attached to the bar.
        Grab the bar with the palms facing forward using the prescribed grip.As you have both arms extended in front of you holding the bar at the chosen grip width, bring your torso back around 30 degrees or so while creating a curvature on your lower back and sticking your chest out. This is your starting position.
        As you breathe out, bring the bar down until it touches your upper chest by drawing the shoulders and the upper arms down and back.
        After a second at the contracted position squeezing your shoulder blades together, slowly raise the bar back to the starting position when your arms are fully extended and the lats are fully stretched. Inhale during this portion of the movement.And repeat.
        """
        machine03.machineType = "Weight"
        machine03.location = 4
        machine03.muscleGroupWorked = "Back, Bicep"
        machine03.gym = gym0
        
        let machine04 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine04.name = "Smith Machine"
        machine04.desc = "The Smith machine is a weight machine used for weight training. It consists of a barbell that is fixed within steel rails allowing only vertical or near-vertical movement. Some Smith machines have the barbell counterbalanced. The machine can be used for a wide variety of exercises though it is most commonly used to perform.. Smith machine squats"
        machine04.machineType = "Weight"
        machine04.location = 5
        machine04.muscleGroupWorked = "Shoulders"
        machine04.gym = gym0
        
        let machine05 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine05.name = "Suspension Trainer"
        machine05.desc = "The term suspension training refers to an approach to strength training that uses a system of ropes and webbing called a suspension trainer to allow users to work against their own body weight."
        machine05.machineType = "Weight"
        machine05.location = 6
        machine05.muscleGroupWorked = "Full Body Workout"
        machine05.gym = gym0
        
        let machine06 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine06.name = "The Roman Chair"
        machine06.desc = "The Roman chair is a piece of exercise equipment. The equipment is mainly used for the lower back, but can also target the gluteal muscles, hamstring and abdominals."
        machine06.machineType = "Weight"
        machine06.location = 7
        machine06.muscleGroupWorked = "Back, Core, Abdominals, Hamstrings, Abs"
        machine06.gym = gym0
        
        let machine07 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine07.name = "Cross Trainer"
        machine07.desc = "An elliptical trainer or cross-trainer (also called an X-trainer) is a stationary exercise machine used to simulate stair climbing, walking, or running without causing excessive pressure to the joints, hence decreasing the risk of impact injuries."
        machine07.machineType = "Cardio"
        machine07.location = 8
        machine07.muscleGroupWorked = "Legs, Cardio"
        machine07.gym = gym0
        
        let machine08 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine08.name = "Stationary Bike"
        machine08.desc = "A stationary bicycle (also known as exercise bicycle, exercise bike, spinning bike, spin bike, or exercycle) is a device with saddle, pedals, and some form of handlebars arranged as on a bicycle."
        machine08.machineType = "Cardiovascular"
        machine08.location = 9
        machine08.muscleGroupWorked = "Cardio, Legs"
        machine08.gym = gym0
        
        let machine09 = NSEntityDescription.insertNewObject(forEntityName: "Machine",into: moc)as! Machine
        machine09.name = "Rowing Machine"
        machine09.desc = "Indoor rowing has become established as a sport in its own right. The term also refers to a participant in this sport. Modern indoor rowers are often known as ergometers (colloquially erg or ergo), an ergometer being a device which measures the amount of work performed."
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
