//
//  File.swift
//  Networking
//
//  Created by Cristian Petra on 24.07.26.
//

import Foundation
import Model
import Model

public protocol UsersServicesProtocol {
    func getUsers(page: Int, results: Int) async throws -> UserResponse
}

public class UsersServices: UsersServicesProtocol {
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func getUsers(page: Int, results: Int) async throws -> UserResponse {
        return try await apiClient.send(
            endpoint: .getUsers(page: page, result: results, seed: "abc")
        )
    }
    
}
