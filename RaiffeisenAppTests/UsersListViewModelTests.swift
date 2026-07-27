//
//  UsersListViewModelTests.swift
//  RaiffeisenAppTests
//
//  Created by Cristian Petra on 25.07.26.
//

import Testing
import Model
import Networking
@testable import RaiffeisenApp

@MainActor
struct UsersListViewModelTests {

    @Test("Initial state should be empty and not loading")
    func initialState() {
        let mockAPIClient = MockAPIClient()
        let mockService = MockUsersServices(apiClient: mockAPIClient)
        
        let viewModel = UsersListViewModel(services: mockService)
        
        #expect(viewModel.users.isEmpty)
        #expect(viewModel.isLoading == false)
        #expect(viewModel.errorMessage.isEmpty)
        #expect(viewModel.page == 1)
        
    }
    
    @Test("fetchUsers successfully")
    func fetchUsersSuccess() async throws {
        // Given
        let mockAPIClient = MockAPIClient()
        let mockService = MockUsersServices(apiClient: mockAPIClient)
        
        let viewModel = UsersListViewModel(services: mockService)
        
        // When
        await viewModel.fetchUsers()
        
        // Then
        #expect(viewModel.users.count == 2)
        #expect(viewModel.isLoading == false  )
    }

}
