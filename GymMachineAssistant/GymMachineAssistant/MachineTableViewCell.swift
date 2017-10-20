//
//  MachineTableViewCell.swift
//  GymMachineAssistant
//
//  Created by Woolery,Matthew A on 10/20/17.
//  Copyright © 2017 Woolery,Matthew A. All rights reserved.
//

import UIKit

class MachineTableViewCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
