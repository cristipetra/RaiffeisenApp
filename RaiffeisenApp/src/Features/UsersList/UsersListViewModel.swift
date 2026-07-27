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
    var canLoadMore: Bool { get }
    var errorMessage: String { get set }
    var prefetchThreshold: Int { get }
    func fetchUsers() async
    func fetchNextPage() async
    func onUserRowAppeared(_ user: User)
}

@Observable
@MainActor
class UsersListViewModel: UsersListViewModelling {
    
    private(set) var users: [User] = []
    private(set) var isLoading: Bool = false
    private(set) var canLoadMore: Bool = true
    private(set) var page: Int = 1
    private(set) var prefetchThreshold: Int = 3
    private let results: Int = 20
    private let maxPages = 3
    
    var errorMessage: String = ""
    
    private let services: UsersServicesProtocol
    
    init(services: UsersServicesProtocol) {
        self.services = services
    }
    
    func fetchUsers() async {
        print("fetch users for page: \(page)")
        guard !isLoading, canLoadMore else { return }
        isLoading = true
        defer { isLoading = false }
        
        do {
            let userResponse = try await services.getUsers(page: page, results: results)
            let newUsers = userResponse.results.filter { candidate in
                !users.contains { $0.id == candidate.id }
            }
            users.append(contentsOf: newUsers)
            canLoadMore = page < maxPages
            print(users)
        } catch {
            errorMessage = "Error downloading users list. Please try again!";
            print("error message")
        }
    }
    
    func fetchNextPage() async {
        guard !isLoading, canLoadMore else { return }
        
        page += 1
        await fetchUsers()
    }
    
    func onUserRowAppeared(_ user: User) {
        guard let index = users.firstIndex(where: { $0.id == user.id }) else { return }
        if index == users.count - prefetchThreshold {
            Task {
                await fetchNextPage()
            }
        }
    }
    
}
