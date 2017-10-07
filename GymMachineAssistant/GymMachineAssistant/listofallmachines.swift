//
//  SecondViewController.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

class MyTableViewCell : UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}

class listofallmachines: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    let machines = ["bench", "squat", "fly", "dips"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //gets count for sections
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return machines.count
    }
    // makes the cells
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        //title
        cell.textLabel?.text = machines[indexPath.row]
        //subtitle will add info to later
        cell.detailTextLabel?.text = ""
        
        return cell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    // refreshes the data each visit
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
