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
        
        var chartData: [(String, Double)] = []
        
        var count = 0
        for workout in globalExercise.workoutHistoryList{
            for set in workout.workoutSetList{
                chartData.append((String(count), set.weight))
                count+=1
            }
        }
        
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
            bars: chartData,
            color: UIColor.blue,
            barWidth: 20
        )
        
        self.view.addSubview(chart.view)
        self.graph = chart
    }
    
    
    @IBAction func predCommand(_ sender: Any) {
        
        let lastWeight = globalExercise.workoutHistoryList.last?.workoutSetList.last?.weight
        let lastDay =  globalExercise.workoutHistoryList.last?.date
        let currentDate = Date()
        let calendar = Calendar.current
        let daysSinceWorkout: Int = calendar.dateComponents([.day], from: lastDay!, to: currentDate).day!
        var pred = try! progressPredictor().prediction(days: Double(daysSinceWorkout), weight: lastWeight!)
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

