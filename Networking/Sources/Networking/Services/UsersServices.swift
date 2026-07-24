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
    func getUsers() async throws -> [User]
}

public class UsersServices: UsersServicesProtocol {
    private let apiClient: APIClientProtocol
    
    public init(apiClient: APIClientProtocol) {
        self.apiClient = apiClient
    }
    
    public func getUsers() async throws -> [User] {
        return []
    }
    
}
