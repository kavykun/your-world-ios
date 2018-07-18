//
//  MapAnnotation.swift
//  YourWorld
//
//  Created by Joey Rattana on 7/18/18.
//  Copyright © 2018 Joey Rattana. All rights reserved.
//

import Foundation

import MapKit

class MapAnnotation: NSObject, MKAnnotation {
    //1
    let coordinate: CLLocationCoordinate2D
    let title: String?
    //2
    let item: LocationItem
    //3
    init(location: CLLocationCoordinate2D, item: LocationItem) {
        self.coordinate = location
        self.item = item
        self.title = item.itemDescription
        
        super.init()
    }
}
