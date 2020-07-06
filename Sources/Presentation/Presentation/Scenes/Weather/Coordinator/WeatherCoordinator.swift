//
//  WeatherCoordinator.swift
//  Presentation
//
//  Created by Rodrigo Andrade on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import UIKit
import Infrastructure

class WeatherCoordinator {
    
    //MARK: Private Properties
    
    private let presenter: UINavigationController
    private var weatherController: WeatherViewController
    
    //MARK: Inits
    
    init(presenter: UINavigationController) {
        self.presenter = presenter
        self.weatherController = WeatherViewController()
    }
}

extension WeatherCoordinator: Coordinator {
    
    func start() {
        presenter.pushViewController(weatherController, animated: true)
    }
}
