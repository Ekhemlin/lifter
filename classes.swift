//
//  classes.swift
//  lifter
//
//  Created by EItan Khemlin  on 2018-10-21.
//  Copyright © 2018 EItan Khemlin . All rights reserved.
//

import Foundation
import Realm 
import RealmSwift

// The amount of reps performed for the given exercise.
class ExerciseSet: Object{
    @objc dynamic var reps = 0
    @objc dynamic var weight = 0.0
    convenience init(reps: Int, weight: Double){
        self.init()
        self.reps = reps
        self.weight = weight
    }
}

// All sets of an exercises performed on the date.
class Workout: Object{
    @objc dynamic var date = Date()
    var workoutSetList = List<ExerciseSet>()
    @objc dynamic var name = ""
    convenience init(setlist: List<ExerciseSet>, name: String){
        self.init()
        self.name = name
        self.workoutSetList = setlist
    }
}

// The description of a sigle exercise from a workout.
class Exercise: Object{
    @objc dynamic var name = ""
    @objc dynamic var startingWeight = 0
    @objc dynamic var increment = 5.0
    var workoutHistoryList = List<Workout>() 
    convenience init(name: String, startWeight: Int, increment: Double){
        self.init()
        self.name = name
        self.startingWeight = startWeight
        self.increment = increment
    }
}



