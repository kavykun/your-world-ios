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
    
    var menu_vc : MenuViewController!
    var targets = [LocationItem]()
    var userLocation: CLLocation?
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        menu_vc = self.storyboard?.instantiateViewController(withIdentifier: "MenuViewController") as! MenuViewController
        
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

    @IBAction func menu_Action(_ sender: UIBarButtonItem) { //show menu on ham btn press
        if AppDelegate.menu_bool{
            show_menu()
        }
        else{
            close_menu()
        }
    }
    
    func show_menu()
    {
        
    UIView.animate(withDuration: 0.3) { ()->Void in
        //  \/ error Argument labels '(x:, y:, width:, hight:)' do not match any available overloads
        
        //self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width, hight: UIScreen.main.bounds.size.height)
        self.menu_vc.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.addChildViewController(self.menu_vc)
        self.view.addSubview(self.menu_vc.view)
        AppDelegate.menu_bool = false
     }
    }
    
    func close_menu()
    {
        UIView.animate(withDuration: 0.3, animations: { ()->Void in
            //self.menu_vc.view.frame = CGRect(x: 0, y: 60, width: UIScreen.main.bounds.size.width,hight: UIScreen.main.bounds.size.height)
        }) { (finished) in
            
        self.menu_vc.view.removeFromSuperview()
    }
        AppDelegate.menu_bool = true
        
    }
    
}

extension MainScreenViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        self.userLocation = userLocation.location
    }
}
