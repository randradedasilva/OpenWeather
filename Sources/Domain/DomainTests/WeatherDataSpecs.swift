//
//  WeatherDataSpecs.swift
//  WeatherDataSpecs
//
//  Created by Rodrigo Andrade on 03/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import Quick
import Nimble

@testable import Domain

class WeatherDataSpecs: QuickSpec {
    override func spec() {
        var sut: WeatherData!
        describe("a 'WeatherData'") {
            context("Can be created with valid JSON") {
                afterEach {
                    sut = nil
                }
                beforeEach {
                    if let path = Bundle(for: type(of: self)
                    ).path(forResource: "weather", ofType: "json") {
                        do {
                            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                            let decoder = JSONDecoder()
                            sut = try decoder.decode(WeatherData.self, from: data)
                        } catch {
                            fail("Problem parsing JSON")
                        }
                    }
                }
                it("should be able to create a weather data from json") {
                    expect(sut).toNot(beNil())
                }
                
                it("should have a city name") {
                    expect(sut.name).toNot(beNil())
                }
                
                it("should have a temperature") {
                    expect(sut.main.temp).toNot(beNil())
                }
            }
        }
    }
}
