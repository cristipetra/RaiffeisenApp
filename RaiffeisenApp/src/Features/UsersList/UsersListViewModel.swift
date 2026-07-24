//
//  UsersListViewModel.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 24.07.26.
//

import Foundation
import Networking
import Model

protocol UsersListViewModelling {
    var users: [User] { get }
    func fetchUsers() async
}

@Observable
class UsersListViewModel: UsersListViewModelling {
    
    private(set) var users: [User] = []
    
    private let services: UsersServicesProtocol
    
    init(services: UsersServicesProtocol) {
        self.services = services
    }
    
    func fetchUsers() async {
        do {
            users = try await services.getUsers()
        } catch {
            print("error message")
        }
    }
    
}
