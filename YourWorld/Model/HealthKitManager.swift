//
//  HealthKitManager.swift
//  YourWorld
//
//  Created by Joey Rattana on 8/19/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import Foundation
import UIKit
import HealthKit

class HealthKitManager {
    
    let healthStore = HKHealthStore()
    
    func authorizeHealthKit() -> Bool {
    
    var isEnabled = true
    
    if HKHealthStore.isHealthDataAvailable() {
        
        let stepsCount = NSSet(object: HKQuantityType.quantityType(forIdentifier: HKQuantityTypeIdentifier.stepCount))
    
    let dataTypesToWrite = NSSet(object:stepsCount)
    let dataTypesToRead = NSSet(object: stepsCount)
    
        healthStore.requestAuthorization(toShare: nil, read: (stepsCount as! Set<HKObjectType>)) {
            (success, error) -> Void in
            isEnabled = success
        }
    }else{
        
        isEnabled = false
        }
        return isEnabled
    }
}
