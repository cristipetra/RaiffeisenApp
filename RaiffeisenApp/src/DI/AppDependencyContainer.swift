//
//  AppDependencyContainer.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 24.07.26.
//

import Foundation
import Networking
import Model

protocol DependencyContainer {
    func makeUsersListViewModel() -> UsersListViewModel
}

class AppDependencyContainer: DependencyContainer {
    private let apiConfiguration: APIConfiguration = .development
    
    private(set) lazy var apiClient: APIClientProtocol = APIClient(apiConfiguration: apiConfiguration, session: URLSession.shared)
    
    // Services
    private(set) lazy var usersServices: UsersServicesProtocol = UsersServices(apiClient: apiClient)
     
    func makeUsersListViewModel() -> UsersListViewModel {
        UsersListViewModel(services: usersServices)
    }
    
    func makeUserDetailsViewModel(user: User) -> UserDetailViewModel {
        UserDetailViewModel(user: user)
    }
        
}
