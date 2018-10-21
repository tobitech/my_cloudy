//
//  WeekViewViewModelTests.swift
//  CloudyTests
//
//  Created by Oluwatobi Omotayo on 20/10/2018.
//  Copyright © 2018 Cocoacasts. All rights reserved.
//

import XCTest
@testable import Cloudy

class WeekViewViewModelTests: XCTestCase {
    
    // MARK: - Properties
    
    var viewModel: WeekViewViewModel!

    // MARK: - Setup and Tear Down
    
    override func setUp() {
        super.setUp()
        
        let data = loadStubFromBundle(withName: "darksky", extension: "json")
        
        let weatherData: WeatherData = try! JSONDecoder.decode(data: data)
        
        // Initialize View Model
        viewModel = WeekViewViewModel(weatherData: weatherData.dailyData)
    }

    override func tearDown() {
        super.tearDown()
    }
    
    // MARK: - Tests for Number of Sections
    
    func testNumberOfSections() {
        XCTAssertEqual(viewModel.numberOfSections, 1)
    }
    
    func testNumberOfDays() {
        XCTAssertEqual(viewModel.numberOfDays, 8)
    }
    
    func testViewModelForIndex() {
        let weatherDayDataViewModel = viewModel.viewModel(for: 5)
        
        XCTAssertEqual(weatherDayDataViewModel.day, "Saturday")
        XCTAssertEqual(weatherDayDataViewModel.date, "July 15")
    }

}
