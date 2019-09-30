//
//  ViewController.swift
//  lifter
//
//  Created by EItan Khemlin  on 2018-10-21.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

import UIKit
import RealmSwift
import Realm

let realm = try! Realm()


var globalExercise = Exercise()

class ListExercisesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var exerciseArray = realm.objects(Exercise.self)
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //IBACTIONS
    
    @IBAction func trackExercisePressed(_ sender: Any) {
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let newViewController = storyBoard.instantiateViewController(withIdentifier: "ExerciseViewController") as! ExerciseViewController
        self.present(newViewController, animated: true, completion: nil)
//        let viewController: NewExerciseViewController = self.storyboard?.instantiateViewController(withIdentifier: "VC") as! NewExerciseViewController
//        self.present(viewController, animated: true, completion: nil)
    }
    
    @IBAction func addNewExercisePressed(_ sender: UIButton) {
        performSegue(withIdentifier: "addNew", sender: nil)
    }
        

    //TABLE VIEW ACTIONS
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exerciseArray.count
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
     if editingStyle == .delete {
        let exerciseToDelete = exerciseArray[indexPath.row]
        try! realm.write{
            realm.delete(exerciseToDelete)
        }
        tableView.deleteRows(at: [indexPath], with: .fade)
     }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let liftCell = tableView.dequeueReusableCell(withIdentifier: "liftCell", for: indexPath) as? ExerciseTableViewCell  else {
        fatalError("The dequeued cell is not an instance of liftCell.")
        }
        let exercise = exerciseArray[indexPath.row]
        liftCell.owner = exercise
        liftCell.liftCellLabel.text = exercise.name
        liftCell.view = self
        liftCell.selectionStyle = UITableViewCell.SelectionStyle.none
        return liftCell
    }
  
    


}

