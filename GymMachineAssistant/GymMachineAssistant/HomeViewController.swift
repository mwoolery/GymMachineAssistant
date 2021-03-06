//
//  HomeViewController.swift
//  GymMachineAssistant
//
//  Created by student on 11/2/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    // This is the splash screen that we see while the app loads
    override func viewDidLoad() {
        super.viewDidLoad()
        let when = DispatchTime.now() + 2
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.performSegue(withIdentifier: "navigateToTabs", sender: self)
        }
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
