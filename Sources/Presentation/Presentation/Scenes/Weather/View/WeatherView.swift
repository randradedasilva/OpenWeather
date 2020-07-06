//
//  WeatherView.swift
//  OpenWeather
//
//  Created by randradedasilva on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import Foundation
import UIKit
import Reusable

class WeatherView: UIView, CodeView, Reusable {
    
    // MARK: - Inits
    
    init() {
        super.init(frame: .zero)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init: coder has not been implemented")
    }
    
    // MARK: - Private Properties
    
    private let cityNameLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60, weight: UIFont.Weight.thin)
        label.textColor = .white
        return label
        
    }()
    
    private let forecastLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Forecast for next 4 days"
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.thin)
        label.textColor = .white
        return label
        
    }()
    
    private let temperatureMinLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Min"
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.thin)
        label.textColor = .white
        return label
        
    }()
    
    private let temperatureMaxLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.text = "Max"
        label.font = UIFont.systemFont(ofSize: 22, weight: UIFont.Weight.thin)
        label.textColor = .white
        return label
        
    }()
    
    private let conditionLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 40, weight: UIFont.Weight.thin)
        label.textColor = .white
        return label
        
    }()
    
    private let temperatureLabel: UILabel = {
        var label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 60, weight: UIFont.Weight.thin)
        label.textColor = .white
        return label
        
    }()
    
    private let imageView: UIImageView = {
        var imageView = UIImageView()
        imageView.image = UIImage(named: "base-background")
        return imageView
        
    }()
    
    // MARK: - Lazy Properties
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.addArrangedSubview(cityNameLabel)
        stackView.addArrangedSubview(conditionLabel)
        stackView.addArrangedSubview(temperatureLabel)
        
        return stackView
    }()
    
    private lazy var mainView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.addSubview(self.imageView)
        view.addSubview(self.tableView)
        view.addSubview(self.stackView)
        view.addSubview(self.forecastLabel)
        view.addSubview(self.temperatureMinLabel)
        view.addSubview(self.temperatureMaxLabel)
        return view
    }()
    
    //MARK: Public Properties
    
    public var tableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .clear
        return tableView
    }()
    
    
    // MARK: - Internal Methods
    
    internal func buildHierarchy() {
        self.addSubview(mainView)
        
    }
    
    internal func buildConstraints() {
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: self.topAnchor,constant: 150).isActive = true
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 0).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor,constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 0).isActive = true
        
        forecastLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        forecastLabel.leftAnchor.constraint(equalTo: self.leftAnchor,constant: 20).isActive = true
        forecastLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: 200).isActive = true
        
        temperatureMinLabel.rightAnchor.constraint(equalTo: self.rightAnchor,constant: -20).isActive = true
        temperatureMinLabel.bottomAnchor.constraint(equalTo: self.forecastLabel.bottomAnchor).isActive = true
        temperatureMinLabel.topAnchor.constraint(equalTo: self.forecastLabel.topAnchor).isActive = true
        
        temperatureMaxLabel.leftAnchor.constraint(equalTo: self.temperatureMinLabel.leftAnchor,constant: -60).isActive = true
        temperatureMaxLabel.bottomAnchor.constraint(equalTo: self.forecastLabel.bottomAnchor).isActive = true
        temperatureMaxLabel.topAnchor.constraint(equalTo: self.forecastLabel.topAnchor).isActive = true
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    // MARK: - Public Methods
    
    func configureView(viewModel: WeatherViewModel) {
        let cityName = viewModel.weather?.name
        let condition = viewModel.weather?.weather.first?.main
        let temperature = String(format: "%.0f", viewModel.weather?.main.temp ?? "")
        
        self.cityNameLabel.text = cityName
        self.conditionLabel.text = condition
        self.temperatureLabel.text = " \(temperature)°"
        
    }
}
