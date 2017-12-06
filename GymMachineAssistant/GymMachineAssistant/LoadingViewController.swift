//
//  LoadingViewController.swift
//  GymMachineAssistant
//
//  Created by student on 12/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

class LoadingViewController: UIViewController {

    // Core Data is not done correctly unless this splash screen is added. This happens very fast though so it shouldn't be noticable
    override func viewDidLoad() {
        super.viewDidLoad()
        let when = DispatchTime.now() + 0.05
        // We have to do this load screen so that the core data is loaded properly
        DispatchQueue.main.asyncAfter(deadline: when) {
            // After the .05 seconds have passed after loading the application, segue to our tab bar controller
            self.performSegue(withIdentifier: "navigateToTabs", sender: self)
        }
        
    }
        // Do any additional setup after loading the view.
       
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
