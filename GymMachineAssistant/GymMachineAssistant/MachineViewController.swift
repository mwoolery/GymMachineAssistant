//
//  MachineViewController.swift
//  GymMachineAssistant
//
//  Created by Kalvakota,Vaishnavi on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

// may not actually need this view controller
class MachineViewController: UIViewController {
    
    var machine:Machine!
    
    @IBOutlet weak var descriptionTV: UITextView!
    
    @IBOutlet weak var machineNameLBL: UILabel!
    
    @IBOutlet weak var exerciseTypeLBL: UILabel!
    
    @IBOutlet weak var muscleGroupLBL: UILabel!
    
    @IBOutlet weak var machineImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // get image name
        let imgName = machine.name!
        //set the label to the name of machine
        machineNameLBL.text = machine.name
        //set the label to the exercise type
        exerciseTypeLBL.text = machine.machineType
        //set the label to what is being worked
        muscleGroupLBL.text = machine.muscleGroupWorked
        //set the text to the description of how to use
        descriptionTV.text = machine.desc
        //set the image
        machineImage.image = UIImage(named: "\(imgName).jpg")
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
