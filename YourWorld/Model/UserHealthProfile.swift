//
//  UserHealthProfile.swift
//  YourWorld
//
//  Created by Joey Rattana on 8/7/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import HealthKit

class UserHealthProfile {
    
    var age: Int?
    var biologicalSex: HKBiologicalSex?
    var bloodType: HKBloodType?
    var heightInMeters: Double?
    var weightInKilograms: Double?
    
    var bodyMassIndex: Double? {
        
        guard let weightInKilograms = weightInKilograms,
            let heightInMeters = heightInMeters,
            heightInMeters > 0 else {
                return nil
        }
        
        return (weightInKilograms/(heightInMeters*heightInMeters))
    }
}

