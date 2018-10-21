//
//  DayViewViewModelTests.swift
//  CloudyTests
//
//  Created by Oluwatobi Omotayo on 19/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class DayViewViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var viewModel: DayViewViewModel!

    // MARK: - Setup and Tear Down
    
    override func setUp() {
        super.setUp()
        
        // load stub
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        // Initialize ViewModel
        viewModel = DayViewViewModel(weatherData: weatherData)
    }

    override func tearDown() {
        super.tearDown()
        
        // Reset UserDefaults
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.unitsNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.temperatureNotation)
        UserDefaults.standard.removeObject(forKey: UserDefaultsKeys.timeNotation)
    }
    
    // MARK: - Tests for Date
    
    func testDate() {
        XCTAssertEqual(viewModel.date, "Tue, July, 11")
    }
    
    // MARK: - Tests for Time
    
    func testTime_TwelveHour() {
        let timeNotation: TimeNotation = .twelveHour
        
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        
        XCTAssertEqual(viewModel.time, "12:57 PM")
        
    }
    
    func testTime_TwentyFourHour() {
        let timeNotation: TimeNotation = .twentyFourHour
        
        UserDefaults.standard.set(timeNotation.rawValue, forKey: UserDefaultsKeys.timeNotation)
        
        XCTAssertEqual(viewModel.time, "12:57")
        
    }
    
    // MARK: - Tests for Temperature
    
    func testSummary() {
        XCTAssertEqual(viewModel.summary, "Clear")
    }
    
    // MARK: - Tests for WindSpeed
    
    func testWindSpeed_Imperial() {
        let unitsNotation: UnitsNotation = .imperial
        
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        XCTAssertEqual(viewModel.windSpeed, "6 MPH")
        
    }
    
    func testWindSpeed_Metric() {
        let unitsNotation: UnitsNotation = .metric
        
        UserDefaults.standard.set(unitsNotation.rawValue, forKey: UserDefaultsKeys.unitsNotation)
        
        XCTAssertEqual(viewModel.windSpeed, "10 KPH")
        
    }
    
    // MARK: - Tests for Temperature
    
    func testTemperature_Fahrenheit() {
        let temperatureNotation: TemperatureNotation = .fahrenheit
        
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "44.5 °F")
        
    }
    
    func testTemperature_Celsius() {
        let temperatureNotation: TemperatureNotation = .celsius
        
        UserDefaults.standard.set(temperatureNotation.rawValue, forKey: UserDefaultsKeys.temperatureNotation)
        
        XCTAssertEqual(viewModel.temperature, "6.9 °C")
        
    }
    
    // MARK: - Tests for image
    
    func testImage() {
        let viewModelImage = viewModel.image
        let imageDataViewModel = viewModelImage!.pngData()
        let imageDataReference = UIImage(named: "clear-day")!.pngData()
        
        XCTAssertNotNil(viewModelImage)
        XCTAssertEqual(viewModelImage!.size.width, 236.0)
        XCTAssertEqual(viewModelImage!.size.height, 236.0)
        XCTAssertEqual(imageDataViewModel, imageDataReference)
    }

}
