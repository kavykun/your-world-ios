//
//  HealthViewController.swift
//  YourWorld
//
//  Created by Joey Rattana on 8/7/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import Foundation

import UIKit

class HealthViewController: UITableViewController {
    
    private let authorizeHealthKitSection = 1
    
    private func authorizeHealthKit() {
        HealthKitSetupAssistant.authorizeHealthKit { (authorized, error) in
            
            guard authorized else {
                
                let baseMessage = "HealthKit Authorization Failed"
                
                if let error = error {
                    print("\(baseMessage). Reason: \(error.localizedDescription)")
                } else {
                    print(baseMessage)
                }
                
                return
            }
            
            print("HealthKit Successfully Authorized.")
        }
        
    }
    
    // MARK: - UITableView Delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == authorizeHealthKitSection {
            authorizeHealthKit()
        }
    }
}
