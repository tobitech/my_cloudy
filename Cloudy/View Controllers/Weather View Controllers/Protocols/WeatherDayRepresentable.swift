//
//  WeatherDayRepresentable.swift
//  Cloudy
//
//  Created by Oluwatobi Omotayo on 19/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import UIKit

protocol WeatherDayRepresentable {
    var day: String { get }
    var date: String { get }
    var image: UIImage? { get }
    var windSpeed: String { get }
    var temperature: String { get }
}
