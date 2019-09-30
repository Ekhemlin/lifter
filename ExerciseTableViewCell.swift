//
//  ExerciseTableViewCell.swift
//  lifter
//
//  Created by EItan Khemlin  on 2018-10-21.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

import UIKit
//todo: cells are not selectable


class ExerciseTableViewCell: UITableViewCell {

    var owner = Exercise()
    var view = UIViewController()
    
    
    
    @IBOutlet weak var liftCellButton: UIButton!
    @IBOutlet weak var liftCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func liftCellButtonClicked(_ sender: UIButton) {
        globalExercise = owner
        self.view.performSegue(withIdentifier: "showExercise", sender: nil)
    }
    
}
