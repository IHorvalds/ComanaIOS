//
//  LocationHelper.swift
//  Comana
//
//  Created by Tudor Croitoru on 23/10/2021.
//

import Foundation
import CoreLocation

class LocationHelper {
    
    enum status {
        case EnabledAndFullAccuracy
        case EnabledAndRejected
        case EnabledAndRestricted
        case Disabled
    }
    
    let locationManager = CLLocationManager()
    
    static func checkPermissions() {
        if CLLocationManager.locationServicesEnabled() {
//            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        }
    }
    
}
