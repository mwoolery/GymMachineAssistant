//
//  AppDelegate.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit
import CoreData
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        // Michael Rogers created this file manager example
        func fileManagerPlay(){
            let fm:FileManager = FileManager.default
            
            var docsURL:URL
            var coreDataCanaryURL:URL
            // Check to see if the file exists, if it does doCoredata and write the file
            //If it exists Core Data has already been done and no need to re run it
            do {
                try docsURL = fm.url(for: .documentDirectory, in: .userDomainMask,
                                     appropriateFor: nil, create: false)
                coreDataCanaryURL = docsURL.appendingPathComponent("Core Data In Use").appendingPathExtension("txt")
                print(coreDataCanaryURL)
                if !fm.fileExists(atPath: coreDataCanaryURL.path){
                    // the code here will only be called once when the app is first installed
                    try "Hello".write(to: coreDataCanaryURL, atomically: true, encoding:.ascii)
                    // create the Core Data Model
                    CoreDataModel.doCoreData()
                    print("Core data completed")
                }
                
            }catch {
                print("Something has gone wrong: \(error)")
            }
        }
        fileManagerPlay()
        
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    //Below This is for the Core Data Functionality
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "Gym")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // Save for Core Data Context
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

