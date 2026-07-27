//
//  File.swift
//  Networking
//
//  Created by Cristian Petra on 24.07.26.
//

import Foundation
import Model

public class MockUsersServices: UsersServicesProtocol {
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func getUsers(page: Int, results: Int) async throws -> UserResponse {
        MockUserResponse.defaultResponse
    }
    
}
