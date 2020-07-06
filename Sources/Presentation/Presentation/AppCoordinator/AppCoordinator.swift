//
//  AppCoordinator.swift
//  Presentation
//
//  Created by Rodrigo Andrade on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import Foundation
import UIKit
import Infrastructure

class AppCoordinator {
    
    //MARK: Private Properties
    
    private let window: UIWindow
    private let rootViewController: UINavigationController
    private var childCoordinators = [Coordinator]()
    private let weatherCoordinator: WeatherCoordinator
    
    //MARK: Inits
    
    init(window: UIWindow) {
        self.window = window
        rootViewController = UINavigationController()
        rootViewController.navigationBar.prefersLargeTitles = true
        weatherCoordinator = WeatherCoordinator(presenter: rootViewController)
    }
     
    //MARK: Private Methods
    
    private func weatherFlow() {
        weatherCoordinator.start()
        childCoordinators.append(weatherCoordinator)
    }
}

extension AppCoordinator: Coordinator {
    
    func start() {
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        weatherFlow()
    }
}
