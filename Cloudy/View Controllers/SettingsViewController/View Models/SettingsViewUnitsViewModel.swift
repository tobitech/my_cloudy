//
//  SettingsViewUnitsViewModel.swift
//  Cloudy
//
//  Created by Oluwatobi Omotayo on 19/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

struct SettingsViewUnitsViewModel {
    
    // MARK: - Properties
    
    let unitsNotation: UnitsNotation
    
    // MARK: - Public Interface
    
    var text: String {
        switch unitsNotation {
        case .imperial: return "Imperial"
        case .metric: return "Metric"
        }
    }
    
    var accessoryType: UITableViewCell.AccessoryType {
        if UserDefaults.unitsNotation() == unitsNotation {
            return .checkmark
        } else {
            return .none
        }
    }
    
}

extension SettingsViewUnitsViewModel: SettingsRepresentable {
    
}
