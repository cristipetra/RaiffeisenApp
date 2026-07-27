//
//  MockAPIClient.swift
//  Networking
//
//  Created by Cristian Petra on 27.07.26.
//

import Foundation

public final class MockAPIClient: APIClientProtocol {
    
    public var resultToReturn: Result<Any, Error>?
    
    public private(set) var sendCallCount = 0
    public private(set) var lastRequestedEndpoint: APIEndpoint?

    public init() {}

    public func send<T: Decodable>(endpoint: APIEndpoint) async throws -> T {
        sendCallCount += 1
        lastRequestedEndpoint = endpoint

        guard let result = resultToReturn else {
            fatalError("Please set resultToReturn on MockAPIClient before calling send()")
        }

        switch result {
        case .success(let value):
            guard let typedValue = value as? T else {
                fatalError("MockAPIClient return value type mismatch. Expected \(T.self), but got \(type(of: value))")
            }
            return typedValue

        case .failure(let error):
            throw error
        }
    }
}
