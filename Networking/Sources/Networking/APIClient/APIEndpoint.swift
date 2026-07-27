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
    var queryItems: [URLQueryItem]? { get }
}

public enum APIEndpoint: Endpoint {
    case getUsers(page: Int, result: Int, seed: String)
    
    public var path: String {
        switch self {
        case .getUsers:
            return ""
        }
    }
        
    public var method: HTTPMethod {
        .get
    }
    
    public var queryItems: [URLQueryItem]? {
        switch self {
        case .getUsers(let page, let result, let seed):
            return [
                URLQueryItem(name: "page", value: "\(page)"),
                URLQueryItem(name: "result", value: "\(result)"),
                URLQueryItem(name: "seed", value: "\(seed)")
            ]
        }
    }
    
}
