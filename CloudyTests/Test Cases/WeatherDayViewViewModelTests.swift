//
//  WeatherDayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Oluwatobi Omotayo on 21/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeatherDayViewViewModelTests: XCTestCase {
    
    var viewModel: WeatherDayViewViewModel!

    override func setUp() {
        super.setUp()
        
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        // Initialize View Model
        viewModel = WeatherDayViewViewModel(weatherDayData: weatherData.dailyData[5])
        
    }

    override func tearDown() {
       super.tearDown()
        
        // Reset UserDefaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
    }
    
    // MARK: - Tests for Day
    
    func testDay() {
        XCTAssertEqual(viewModel.day, "Saturday")
    }
    
    // MARK: - Tests for Date
    
    func testDate() {
        XCTAssertEqual(viewModel.date, "July 15")
    }
    
    // MARK: - Tests for Temperature
    
    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "36.6 °F - 46.6 °F")
        
    }
    
    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "2.5 °C - 8.1 °C")
        
    }
    
    // MARK: - Tests for WindSpeed
    
    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        XCTAssertEqual(viewModel.windSpeed, "1 MPH")
        
    }
    
    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        XCTAssertEqual(viewModel.windSpeed, "2 KPH")
        
    }
    
    // MARK: - Tests for image
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()
        let imageDataReference = UIImage(named: "cloudy")!.pngData()
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 172.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }

}
