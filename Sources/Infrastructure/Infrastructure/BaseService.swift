//
//  BaseService.swift
//  Infrastructure
//
//  Created by randradedasilva on 05/07/20.
//  Copyright © 2020 randradedasilva. All rights reserved.
//

import Foundation

public class BaseService {
    
    public let baseApiUrl = "http://api.openweathermap.org/data/2.5"
    public let apiKey = "28e4b080257ed20ea954216e26f812d3"
    
    public let decoder = JSONDecoder()
    
    public init() {}
    
    public func parseError(_ response: Data?, error: Error) -> String {
        if error._code == NSURLErrorTimedOut {
            return "timeout-error"
        }
        guard let data = response, let responseError = try? JSONDecoder().decode(ServiceError.self, from: data) else {
            return error.localizedDescription
        }
        return responseError.error.message
    }
}
