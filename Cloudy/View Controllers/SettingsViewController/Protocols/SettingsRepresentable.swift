//
//  SettingsRepresentable.swift
//  Cloudy
//
//  Created by Oluwatobi Omotayo on 19/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

protocol SettingsRepresentable {
    
    var text: String { get }
    var accessoryType: UITableViewCell.AccessoryType { get }
    
}
