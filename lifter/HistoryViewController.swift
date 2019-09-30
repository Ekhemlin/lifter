//
//  HistoryViewController.swift
//  lifter
//
//  Created by Eitan Khemlin on 2018-12-16.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

import UIKit
import SwiftChart
import CoreML

class HistoryViewController: UIViewController {

    @IBOutlet weak var graph: Chart!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var predLabel: UILabel!
    
    override func viewDidLoad() {
        nameLabel.text = globalExercise.name
        var workoutHistory = globalExercise.workoutHistoryList
        var weightChartArray: [Double] = []
        
        var test: [(Int, Double)] = []
        
        var count = 0
        for workout in globalExercise.workoutHistoryList{
            for set in workout.workoutSetList{
                test.append((count, set.weight))
                count+=1
            }
        }
      
//
//        let data = [
//            (x: 0, y: 0),
//            (x: 1, y: 3.1),
//            (x: 4, y: 2),
//            (x: 5, y: 4.2),
//            (x: 7, y: 5),
//            (x: 9, y: 9),
//            (x: 10, y: 8)
//        ]
//
//        let series = ChartSeries(data: test)
//        //let series = ChartSeries(weightChartArray)
//        graph.add(series)
//        graph.isUserInteractionEnabled = false
    }
    
    
    @IBAction func predCommand(_ sender: Any) {
        var pred = try! progressPredictor().prediction(days: 2.0, weight: 90)
        predLabel.text = String(Int(pred.nextDay))
    }
    
}
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

