//
//  MachineTableViewController.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/6/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

// used for the tab selection at top
enum selectedScope:Int {
    case name = 0
    case muscleGroupWorked = 1
    
}

class MachineTableViewController: UITableViewController,UISearchBarDelegate {
    
    @IBOutlet var machinesTV: UITableView!
    
    static let myMachines = CoreDataModel.fetchAllItems()
    let initialDataAry:[Machine] = myMachines
    var dataAry:[Machine] = myMachines
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBarSetup()
        
    }
    // Setting up the search bar
    func searchBarSetup() {
        let searchBar = UISearchBar(frame: CGRect(x:0,y:0,width:(UIScreen.main.bounds.width),height:70))
        searchBar.showsScopeBar = true
        //this is to make the tabs
        searchBar.scopeButtonTitles = ["Name","Muscle Group Worked"]
        searchBar.selectedScopeButtonIndex = 0
        searchBar.delegate = self
        machinesTV.tableHeaderView = searchBar
    }
    
    // MARK: - search bar delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            dataAry = initialDataAry
            machinesTV.reloadData()
        }else {
            filterTableView(ind: searchBar.selectedScopeButtonIndex,text: searchText)
        }
    }
    // We use this to update the table view so it displays only machines that the user started to enter for in the search bar
    func filterTableView(ind:Int,text:String) {
        switch ind {
        //filter for when they are searching on name tab
        case selectedScope.name.rawValue:
            // filter the array
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                // return items that fit what we passed in
                return mod.name!.lowercased().contains(text.lowercased())
            })
            //then reload the tableview to reflect current values
            machinesTV.reloadData()
        //filter for when they are on muscle group tab
        case selectedScope.muscleGroupWorked.rawValue:
            
            dataAry = initialDataAry.filter({ (mod) -> Bool in
                //return items that match what was passed in
                return (mod.muscleGroupWorked?.lowercased().contains(text.lowercased()))!
            })
            //reload table view
            machinesTV.reloadData()
            
        default:
            //the default, shouldn't be hit but has to be here for the switch
            print("no type")
        }
    }
    
    //number of sections in the table view
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    //get the number of rows
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // number of rows from dataAry which comes from Core Data.
        return dataAry.count
    }
    // this is what is put into the cells
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // makine the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "machine_cell", for: indexPath)
        //setting the image
        let imgName = dataAry[indexPath.row].name!
        //adding the text
        cell.textLabel?.text = dataAry[indexPath.row].name
        //adding the image
        cell.imageView?.image = UIImage(named: "\(imgName).jpg")
        return cell
    }
    
    // makes the individual machines controllers when the row is tapped
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //instantiate the VC
        let machineVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "machine_view_controller") as! MachineViewController
        //set the machine from the selected row
        machineVC.machine = dataAry[indexPath.row]
        //push it so we can see it
        self.navigationController?.pushViewController(machineVC, animated: true)
    }
    
    // refreshes the data each visit
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
