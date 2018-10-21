//
//  Geocoder.swift
//  Cloudy
//
//  Created by Oluwatobi Omotayo on 21/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import CoreLocation

class Geocoder: LocationService {
    
    private lazy var geocoder = CLGeocoder()
    
    func geocode(addressString: String?, completionHandler: @escaping LocationService.LocationServiceCompletionHandler) {
        
        guard let addressString = addressString else {
            completionHandler([], nil)
            return
        }
        
        // Geocode Address String
        geocoder.geocodeAddressString(addressString) { (placemarks, error) in
            if let error = error {
                completionHandler([], error)
            } else if let _placemarks = placemarks {
                // Update locations
                let locations = _placemarks.compactMap({ (placemark) -> Location? in
                    guard let name = placemark.name else { return nil }
                    guard let location = placemark.location else { return nil }
                    return Location(name: name, latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
                })
                
                completionHandler(locations, nil)
            }
        }
        
    }
}
