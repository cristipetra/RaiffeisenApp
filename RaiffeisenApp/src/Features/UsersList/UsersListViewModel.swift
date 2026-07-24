//
//  UsersListViewModel.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 24.07.26.
//

import Foundation
import Networking
import Model

protocol UsersListViewModelling: Observable {
    var users: [User] { get }
    var isLoading: Bool { get }
    var errorMessage: String { get set }
    func fetchUsers() async
}

@Observable
@MainActor
class UsersListViewModel: UsersListViewModelling {
    
    private(set) var users: [User] = []
    private(set) var isLoading: Bool = false
    var errorMessage: String = ""
    
    private let services: UsersServicesProtocol
    
    init(services: UsersServicesProtocol) {
        self.services = services
    }
    
    func fetchUsers() async {
        print("fetch users")
        isLoading = true
        
        defer {
            isLoading = false
        }
        
        do {
            users = try await services.getUsers()
            print(users)
        } catch {
            errorMessage = "Error downloading users list. Please try again!";
            print("error message")
        }
    }
    
}
