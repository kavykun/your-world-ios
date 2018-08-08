//
//  HealthKitSetupAssistant.swift
//  YourWorld
//
//  Created by Joey Rattana on 8/7/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import HealthKit

class HealthKitSetupAssistant {
    
    private enum HealthkitSetupError: Error {
        case notAvailableOnDevice
        case dataTypeNotAvailable
    }
    
    class func authorizeHealthKit(completion: @escaping (Bool, Error?) -> Swift.Void) {
        
    }
}

