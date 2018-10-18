//
//  UIImage.swift
//  Cloudy
//
//  Created by Oluwatobi Omotayo on 18/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

extension UIImage {
    class func imageForIcon(withName name: String) -> UIImage? {
        switch name {
        case "clear-day", "clear-night", "rain", "snow", "sleet" : return UIImage(named: name)
        case "wind", "cloudy", "partly-cloudy-day", "partly-cloudy-night": return UIImage(named: "cloudy")
        default: return UIImage(named: "clear-day")
        }
    }
}
