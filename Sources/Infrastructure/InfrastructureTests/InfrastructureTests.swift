//
//  InfrastructureTests.swift
//  InfrastructureTests
//
//  Created by randradedasilva on 05/07/20.
//  Copyright © 2020 randradedasilva. All rights reserved.
//

import XCTest
@testable import Infrastructure

class InfrastructureTests: XCTestCase {
    
    func testRequestWeatherReturnResult()  {
        let api = OpenWeatherAPI()
        
        api.requestWeather(city:"Sao%20Paulo",country:"br") { (response, error) in
            XCTAssertTrue(response != nil)
        }
    }
    
    func testRequestForecastReturnResult()  {
        let api = OpenWeatherAPI()
        
        api.requestForecast(lat: -23.55, lon: -46.64) { (response, error) in
            XCTAssertTrue(response != nil)
        }
        
    }
    
    func testRequestWeatherFailed()  {
        
        let api = OpenWeatherAPI()
        
        api.requestWeather(city:"Foo", country: "Foo") { (response, error) in
            XCTAssertTrue(error != nil)
        }
    }
    
    func testRequestForecastFailed() {
        
        let api = OpenWeatherAPI()
        api.requestForecast(lat: -23.55, lon: -46.64){ (response, error) in
            XCTAssertTrue(error != nil)
        }
    }
}
