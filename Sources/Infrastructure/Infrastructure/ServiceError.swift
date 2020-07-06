//
//  ServiceError.swift
//  Infrastructure
//
//  Created by randradedasilva on 05/07/20.
//  Copyright © 2020 randradedasilva. All rights reserved.
//

import Foundation

public struct ServiceError: Decodable {
    
    public let error: ServiceMessageError
    
    public enum CodingKeys: String, CodingKey {
        case error
    }
    
}

public struct ServiceMessageError: Decodable {
    
    public let message: String
    
    public enum CodingKeys: String, CodingKey {
        case message
    }
}
