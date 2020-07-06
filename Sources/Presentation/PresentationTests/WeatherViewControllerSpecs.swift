//
//  WeatherViewControllerSpecs.swift
//  PresentationTests
//
//  Created by randradedasilva on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import OpenWeather

class WeatherViewControllerSpecs: QuickSpec {
    
    override func spec() {
        describe("a weather view controller") {
            var controller = WeatherViewController()
            
            beforeEach {
                let window = UIWindow(frame: UIScreen.main.bounds)
                let repositoryViewController = WeatherViewController()
                window.makeKeyAndVisible()
                controller = repositoryViewController
                window.rootViewController = repositoryViewController
                controller.loadView()
                
            }
            
            it("should be able to create a controller") {
                expect(controller).toNot(beNil())
            }
            
            it("should be able to init a view") {
                expect { () -> Void in
                    let _ = WeatherView(coder: NSCoder())
                }.to(throwAssertion())
            }
            
            it("should trigger fatal error if init with coder") {
                expect { () -> Void in
                    let _ = WeatherViewController(coder: NSCoder())
                }.to(throwAssertion())
            }
            
        }
    }
}

