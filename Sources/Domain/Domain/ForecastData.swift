//
//  ForecastData.swift
//  Domain
//
//  Created by randradedasilva on 06/07/20.
//  Copyright © 2020 randradedasilva. All rights reserved.
//

import Foundation

public struct ForecastData: Codable {
    public let lat, lon: Double?
    public let current: Current?
    public let daily: [Daily]?
    
    public enum CodingKeys: String, CodingKey {
        case lat, lon
        case current, daily
    }
}

public struct Current: Codable {
    public let dt, sunrise, sunset: Int?
    public let weather: [Weather]?
    
    public enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset
        case weather
    }
}

public struct Daily: Codable {
    public let dt, sunrise, sunset: Int?
    public let weather: [Weather]?
    public let temp: Temp?
    
    public enum CodingKeys: String, CodingKey {
        case dt, sunrise, sunset
        case temp
        case weather
    }

}
public struct Temp: Codable {
    public let min, max: Double?
}
