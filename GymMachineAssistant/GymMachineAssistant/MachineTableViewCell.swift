//
//  MachineTableViewCell.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/20/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

//This is used to make MachineTableView's Cells, we had to do this for the navigation controller without storyboard
class MachineTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
