//
//  LocationService.swift
//  Cloudy
//
//  Created by Oluwatobi Omotayo on 21/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import Foundation

protocol LocationService {
    
    typealias LocationServiceCompletionHandler = ([Location], Error?) -> Void
    
    func geocode(addressString: String?, completionHandler: @escaping LocationServiceCompletionHandler)
    
}
