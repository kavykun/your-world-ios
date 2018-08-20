//
//  MainScreenViewController.swift
//  YourWorld
//
//  Created by Joey Rattana on 3/14/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation


class MainScreenViewController: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var targets = [LocationItem]()
    var userLocation: CLLocation?
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.userTrackingMode = MKUserTrackingMode.followWithHeading
        
        func setupLocations() {
            let firstTarget = LocationItem(itemDescription: "location 1", location: CLLocation(latitude: 36.0212784, longitude: -80.00454839999998))
            targets.append(firstTarget)
            
            let secondTarget = LocationItem(itemDescription: "location 2", location: CLLocation(latitude: 36.0213905, longitude: -80.0052574))
            targets.append(secondTarget)
            
            let thirdTarget = LocationItem(itemDescription: "location 3", location: CLLocation(latitude: 36.0221618, longitude: -80.00529640000002))
            targets.append(thirdTarget)
            
            for item in targets {
                let annotation = MapAnnotation(location: item.location.coordinate, item: item)
                self.mapView.addAnnotation(annotation)
            }
        }
        
        setupLocations()
        
        if CLLocationManager.authorizationStatus() == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
        }
        
    }
    
    
}

extension MainScreenViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.userLocation = userLocation.location
    }
}
