//
//  OpenWeatherAPI.swift
//  Infrastructure
//
//  Created by Rodrigo Andrade on 05/07/20.
//  Copyright © 2020 Rodrigo Andrade. All rights reserved.
//

import Foundation
import CodableAlamofire
import Alamofire
import struct Domain.WeatherData
import struct Domain.ForecastData

public class OpenWeatherAPI: BaseService {
    
    public typealias weatherData = WeatherData?
    public typealias forecastData = ForecastData?
    
    public func requestWeather(city:String,country:String,completion: @escaping ((weatherData), _ error: (String?)) -> Void) {
        AF.request("\(baseApiUrl)/weather?appid=\(apiKey)&q=\(city),\(country)&units=metric").responseDecodableObject(decoder: decoder) { (response: AFDataResponse<WeatherData>) in
            switch response.result {
            case .success:
                if let response = response.value {
                    completion(response,nil)
                }
            case .failure(let error):
                let error = self.parseError(response.data, error: error)
                completion(nil,error)
            }
        }
    }
    
    public func requestForecast(lat:Double,lon:Double,completion: @escaping ((forecastData), _ error: (String?)) -> Void) {
        AF.request("\(baseApiUrl)/onecall?appid=\(apiKey)&lat=\(lat)&lon=\(lon)&exclude=hourly,minutely&units=metric").responseDecodableObject(decoder: decoder) { (response: AFDataResponse<ForecastData>) in
            switch response.result {
            case .success:
                if let response = response.value {
                    completion(response,nil)
                }
            case .failure(let error):
                let error = self.parseError(response.data, error: error)
                completion(nil,error)
            }
        }
    }
}
