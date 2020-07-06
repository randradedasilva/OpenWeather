//
//  WeatherData.swift
//  Domain
//
//  Created by randradedasilva on 05/07/20.
//  Copyright © 2020 randradedasilva. All rights reserved.
//

import Foundation

public struct WeatherData: Codable {
    public let weather: [Weather]
    public let main: Main
    public let id: Int
    public let name: String
    public let cod: Int
    public let coord: Coord
}

public struct Main: Codable {
    public let temp, feelsLike, tempMin,tempMax: Double
    public let pressure, humidity: Int
    
    public enum CodingKeys: String, CodingKey {
        case temp
        case feelsLike = "feels_like"
        case tempMin = "temp_min"
        case tempMax = "temp_max"
        case pressure, humidity
    }
}

public struct Weather: Codable {
    public let id: Int
    public let main, weatherDescription, icon: String
    
    public enum CodingKeys: String, CodingKey {
        case id, main
        case weatherDescription = "description"
        case icon
    }
}

// MARK: - Coord
public struct Coord: Codable {
    public let lon, lat: Double?
}
