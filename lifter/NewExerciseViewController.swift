//
//  newExerciseViewController.swift
//  lifter
//
//  Created by EItan Khemlin  on 2018-10-21.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

//TODO
//Time based exercises

import UIKit

class NewExerciseViewController: UIViewController, UITextFieldDelegate {

    var editExercise = false
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var incrementTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Delegates
        self.nameTextField.delegate = self
        self.weightTextField.delegate = self
        self.incrementTextField.delegate = self
        //Costumizing keyboard types 
        weightTextField.keyboardType = .decimalPad
        incrementTextField.keyboardType = .decimalPad
        
        if(editExercise){
            nameTextField.text = globalExercise.name
            weightTextField.text = String(globalExercise.startingWeight)
            incrementTextField.text = String(globalExercise.increment)
        }
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
        return true
    }
    
    @IBAction func confirmCommand(_ sender: UIButton) {
        try! realm.write{
            let weight = (Int(weightTextField.text ?? "50")) ?? 50
            let exerciseName = nameTextField.text ?? "Exercise"
            let increment = (Double(incrementTextField.text ?? "5.0")) ?? 5.0
        
            if(!editExercise){
                let newExercise = Exercise(name: exerciseName, startWeight: weight, increment: increment)
                realm.add(newExercise)
            }
            else{
                globalExercise.startingWeight = weight
                globalExercise.name = exerciseName
                globalExercise.increment = increment
                
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    
}
