//
//  APIConfiguration.swift
//  Networking
//
//  Created by Cristian Petra on 24.07.26.
//
import Foundation

public struct APIConfiguration: Sendable {
    public let baseURL: URL
    
    public init(baseURL: URL) {
        self.baseURL = baseURL
    }
    
    public static let development = APIConfiguration(baseURL: URL(string: "https://randomuser.me/api/")!)
    public static let production  = APIConfiguration(baseURL: URL(string: "https://randomuser.me/api/")!)
}

public extension APIConfiguration {
    func url(for endpoint: APIEndpoint) -> URL {
        baseURL.appendingPathComponent(endpoint.path)
    }
}

public enum APIError: Error {
    case invalidURL
    case invalidResponse
    case statusCode(Int)
    case decoding(Error)
}
