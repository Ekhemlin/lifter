//
//  HistoryViewController.swift
//  lifter
//
//  Created by Eitan Khemlin on 2018-12-16.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

import UIKit
import SwiftCharts
import CoreML

class HistoryViewController: UIViewController {

    weak var graph: Chart!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var predLabel: UILabel!
    
    override func viewDidLoad() {
        nameLabel.text = globalExercise.name
        var workoutHistory = globalExercise.workoutHistoryList
        var weightChartArray: [Double] = []
        
        var test: [(String, Double)] = []
        
        var count = 0
        for workout in globalExercise.workoutHistoryList{
            for set in workout.workoutSetList{
                test.append((String(count), set.weight))
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
        
        let yMin = Double(globalExercise.startingWeight) * 0.9
        let yMax = Double(globalExercise.startingWeight) + globalExercise.increment*12
        
        let chartConfig = BarsChartConfig(
            valsAxisConfig: ChartAxisConfig(from: yMin, to: yMax, by:globalExercise.increment)
        )

        let frame = CGRect(x: 10, y: 200, width: 300, height: 600)
                
        let chart = BarsChart(
            frame: frame,
            chartConfig: chartConfig,
            xTitle: "X axis",
            yTitle: "Y axis",
            bars: test,
            color: UIColor.blue,
            barWidth: 20
        )

        self.view.addSubview(chart.view)
        self.graph = chart
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

