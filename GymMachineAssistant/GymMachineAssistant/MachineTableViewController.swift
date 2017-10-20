//
//  SecondViewController.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit



class MachineTableViewController: UITableViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(MachineTableViewCell.self, forCellReuseIdentifier: "machine_cell")
        
        
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return Gym.machineList.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "machine_cell", for: indexPath)
        
        cell.textLabel?.text = Gym.machineList[indexPath.row].name
        cell.detailTextLabel?.text = Gym.machineList[indexPath.row].machineType
        cell.imageView?.image = UIImage(named: "\(Gym.machineList[indexPath.row].name).jpg")
        return cell
    }
    
    // makes the individual birds controller
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        let machineVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "machine_view_controller") as! MachineViewController
        //machineVC.machine = Gym.machineList[indexPath.row]
        self.navigationController?.pushViewController(machineVC, animated: true)
    }
   
    // refreshes the data each visit
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
