//
//  WeatherViewModel.swift
//  Presentation
//
//  Created by Rodrigo Andrade on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import Foundation
import UIKit
import Infrastructure
import struct Domain.WeatherData
import struct Domain.ForecastData

public class WeatherViewModel {
    
    // MARK: Public Properties
    
    var didCompleteFetch: (() -> ())?
    var getError: String?
    
    public var weather: WeatherData? {
        didSet {
            self.didCompleteFetch?()
        }
    }
    
    public var forecast: ForecastData? {
        didSet {
            self.didCompleteFetch?()
        }
    }
    
    //MARK: Private Properties
    
    private var api = OpenWeatherAPI()
    
    //MARK: Public Methods
    
    func getCurrentWeather(city:String,country:String) {
        api.requestWeather(city:city,country:country,completion: { [weak self] (response, error) in
            if let response = response {
                self?.weather = response
                
            }
            if let error = error {
                self?.getError = error
            }
        })
    }
    
    func getForecast(lat:Double,lon:Double) {
        api.requestForecast(lat:lat,lon:lon,completion: { [weak self] (response, error) in
            if let response = response {
                self?.forecast = response
                
            }
            if let error = error {
                self?.getError = error
            }
        })
    }
    
    func getWeatherCell(at indexPath: IndexPath) -> ForecastTableViewCellViewModel {
        let temperatureMax = String(format: "%.0f", forecast?.daily?[indexPath.row].temp?.max ?? "")
        let temperatureMin = String(format: "%.0f", forecast?.daily?[indexPath.row].temp?.min ?? "")
        let icon = forecast?.daily?[indexPath.row].weather?[indexPath.section].icon
        let condition = forecast?.daily?[indexPath.row].weather?[indexPath.section].main
        
        return ForecastTableViewCellViewModel(condition: condition, temperatureMin: temperatureMin, temperatureMax: temperatureMax, icon: icon)
    }
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfRows() -> Int {
        return 4
    }
    
    func cellForRow(at indexPath: IndexPath, from tableView: UITableView) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ForecastTableViewCell.self)
        cell.configure(with: getWeatherCell(at: indexPath))
        cell.backgroundColor = .clear
        cell.layoutIfNeeded()
        cell.selectionStyle = .none
        return cell
        
    }
}
