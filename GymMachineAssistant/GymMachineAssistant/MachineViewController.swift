//
//  MachineviewViewController.swift
//  GymMachineAssistant
//
//  Created by Kalvakota,Vaishnavi on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

// may not actually need this view controller
class MachineViewController: UIViewController {
    
    //var machine = Machine!
    
    @IBOutlet weak var machineNameLBL: UILabel!
    
    @IBOutlet weak var locationNumberLBL: UILabel!
    
    @IBOutlet weak var exerciseTypeLBL: UILabel!
    
    @IBOutlet weak var muscleGroupLBL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //machineNameLBL.text = machine
        //locationNumberLBL.text =
        //exerciseTypeLBL.text = machine.
        
        //muscleGroupLBL.text = machine.getMuscleGroupWorked(<#T##Machine#>)()
        
        // Do any additional setup after loading the view.
    }

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
