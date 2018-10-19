//
//  SettingsViewTemperatureNotation.swift
//  Cloudy
//
//  Created by Oluwatobi Omotayo on 19/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewTemperatureViewModel {
    
    let temperatureNotation: TemperatureNotation
    
    var text: String {
        switch temperatureNotation {
        case .fahrenheit:
            return "Fahrenheit"
        case .celsius:
            return "Celsius"
        }
    }
    
    var accessoryType: UITableViewCellAccessoryType {
        if UserDefaults.temperatureNotation() == temperatureNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}

extension SettingsViewTemperatureViewModel: SettingsRepresentable {
    
}
