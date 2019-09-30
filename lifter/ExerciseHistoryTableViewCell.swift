//
//  ExerciseHistoryTableViewCell.swift
//  lifter
//
//  Created by Eitan Khemlin on 2019-09-30.
//  Copyright © 2019 EItan Khemlin . All rights reserved.
//

import UIKit

class ExerciseHistoryTableViewCell: UITableViewCell {

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
