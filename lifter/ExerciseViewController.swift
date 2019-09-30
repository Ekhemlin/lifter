//
//  ExerciseViewController.swift
//  lifter
//
//  Created by EItan Khemlin  on 2018-10-21.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

import UIKit
import Realm
import RealmSwift


//todo history / data base?


// TODO
//history

//Edit exercise opens the new exercise view with default values as whatever the input was

class ExerciseViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITableViewDelegate, UITableViewDataSource {
   
    var pickerContentWeight = [Double]()
    var pickerContentReps = [Int]()
    var exerciseSetList = [ExerciseSet]()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var weightSelector: UIPickerView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = globalExercise.name
        let startWeight = globalExercise.startingWeight
        let increment = globalExercise.increment
        for i in 0...9{
            pickerContentWeight.append(Double(startWeight) + increment*Double(i))
        }
        for i in 1...12{
            pickerContentReps.append(i)
        }
    }
    
    // PICKER VIEW
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if(component==0){
            return 10}
        else{
            return 12}
        }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if(component==0){
            return String(pickerContentWeight[row])}
        else{
            return String(pickerContentReps[row])
        }
    }
    
    // TABLE VIEW
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseSetList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let liftCell = tableView.dequeueReusableCell(withIdentifier: "setCell", for: indexPath) as? setTableViewCell  else {
            fatalError("The dequeued cell is not an instance of setCell.")
        }
        let set1 = exerciseSetList[indexPath.row]
        liftCell.repsLabel.text = String(set1.reps)
        liftCell.weightLabel.text = String(set1.weight)
        return liftCell
    }
    
    @IBAction func logSet(_ sender: UIButton) {
        let weight = pickerContentWeight[weightSelector.selectedRow(inComponent: 0)]
        let reps = pickerContentReps[weightSelector.selectedRow(inComponent: 1)]
        let trackedSet = ExerciseSet(reps: reps, weight: weight)
        exerciseSetList.append(trackedSet)
        self.loadView()
    }
    
    @IBAction func goBack(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
        dismiss(animated: true, completion: nil)
    }
    
    //Create a workout with all the sets performed, and add to the workout history of the exercise

    @IBAction func finishExercise(_ sender: UIButton) {
        let finisheSetList = List<ExerciseSet>()
        for i in exerciseSetList{
            finisheSetList.append(i)
        }
        let today = Workout(setlist: finisheSetList, name: globalExercise.name)
            
        try! realm.write{
            globalExercise.workoutHistoryList.append(today)
        }
        exerciseSetList.removeAll()
        self.loadView()
    }
    
    
    @IBAction func showHistory(_ sender: UIButton) {
         performSegue(withIdentifier: "showExerciseHistory", sender: nil)
        
    }
    
    @IBAction func editExercise(_ sender: UIButton) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let editExerciseView = storyBoard.instantiateViewController(withIdentifier: "NewExerciseViewController") as! NewExerciseViewController
        editExerciseView.editExercise = true
        self.navigationController?.pushViewController(editExerciseView, animated: true)
    }
    


}
