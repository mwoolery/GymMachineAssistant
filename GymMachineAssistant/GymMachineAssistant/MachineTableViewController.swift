//
//  SecondViewController.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

enum selectedScope:Int {
    case name = 0
    case muscleGroupWorked = 1
    case location = 2
}

class MachineTableViewController: UITableViewController,UISearchBarDelegate {

    
    
  
    
    let initialDataAry:[Machine] = Gym.machineList
    var dataAry:[Machine] = Gym.machineList
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
        tableView.register(MachineTableViewCell.self,forCellReuseIdentifier: "machine_cell")
    }
    
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = true
        searchBar.scopeButtonTitles = ["name","muscleGroupWorked","location"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        self.tableView.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        if searchText.isEmpty {
            dataAry = initialDataAry
            self.tableView.reloadData()
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex,text: searchText)
        }
    }
    
    func filterTableView(ind:Int,text:String) {
        switch ind {
        case selectedScope.name.rawValue:
            //fix of not searching when backspacing
            
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                print ("\(mod.name.lowercased()) : \(text.lowercased()) \(mod.name.lowercased().contains(text.lowercased()))")
                return mod.name.lowercased().contains(text.lowercased())
            })
            print("reload please")
            self.tableView.reloadData()
        case selectedScope.muscleGroupWorked.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.muscleGroupWorked.lowercased().contains(text.lowercased())
            })
            self.tableView.reloadData()
        case selectedScope.location.rawValue:
            //fix of not searching when backspacing
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                return mod.location == Int(text)
            })
            self.tableView.reloadData()
        default:
            print("no type")
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    // Mark ***************************************************************************
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        guard var Machine = Gym.machineList else {
//            return 0
//        }
        
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
       machineVC.machine = Gym.machineList[indexPath.row]
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
