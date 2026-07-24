//
//  File.swift
//  Networking
//
//  Created by Cristian Petra on 24.07.26.
//

import Foundation

public enum HTTPMethod: String {
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

public protocol Endpoint {
    var path: String { get }
    var method: HTTPMethod { get }
}

public enum APIEndpoint: Endpoint {
    case getUsers
    
    public var path: String {
        switch self {
        case .getUsers:
            return ""
        }
    }
        
    public var method: HTTPMethod {
        .get
    }
    
}
