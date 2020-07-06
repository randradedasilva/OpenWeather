//
//  WeatherViewController.swift
//  OpenWeather
//
//  Created by Rodrigo Andrade on 03/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import UIKit
import Infrastructure

class WeatherViewController: UIViewController {
    
    //MARK: Private Properties
    
    private var viewModel =  WeatherViewModel()
    private let weatherView = WeatherView()
    
    //MARK: Inits
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    //MARK: View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewModel()
        
    }
    override func loadView() {
        super.loadView()
        self.view = weatherView
        
    }
    
    //MARK: Public Methods
    
    func setupView(){
        self.weatherView.tableView.register(cellType: ForecastTableViewCell.self)
        self.weatherView.tableView.rowHeight = 35
        self.weatherView.tableView.separatorStyle = .none
        self.weatherView.tableView.dataSource = self
    }
    
    func setupViewModel() {
        viewModel.didCompleteFetch = {
            self.weatherView.configureView(viewModel: self.viewModel)
            if let lat = self.viewModel.weather?.coord.lat, let lon = self.viewModel.weather?.coord.lon {
                self.viewModel.getForecast(lat: lat, lon: lon)
                self.weatherView.tableView.reloadData()
            }
        }
        viewModel.getCurrentWeather(city:"Sao%20Paulo",country:"br")
    }
}

    // MARK: UITableViewDataSource

extension WeatherViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.numberOfSections()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return self.viewModel.cellForRow(at: indexPath, from: tableView)
    }
}
