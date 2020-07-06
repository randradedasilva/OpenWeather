//
//  WeatherViewModelTests.swift
//  PresentationTests
//
//  Created by randradedasilva on 06/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import XCTest
@testable import OpenWeather

class WeatherViewModelTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    var timeout: TimeInterval = 5.0
    
    func testFetchCurrentWeather() {
        let exp = expectation(description: #function)
        let viewModel = WeatherViewModel()
        
        viewModel.didCompleteFetch = {
            XCTAssert(true)
            exp.fulfill()
        }
        
        viewModel.getCurrentWeather(city: "Sao%20Paulo", country: "br")
        
        waitForExpectations(timeout: timeout, handler: nil)
        
    }
}

