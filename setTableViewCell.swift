//
//  setTableViewCell.swift
//  lifter
//
//  Created by EItan Khemlin  on 2018-10-27.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

import UIKit

class setTableViewCell: UITableViewCell {

    @IBOutlet weak var repsLabel: UILabel!
    @IBOutlet weak var weightLabel: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
