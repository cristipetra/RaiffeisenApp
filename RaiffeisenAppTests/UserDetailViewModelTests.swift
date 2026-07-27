//
//  UserDetailViewModelTests.swift
//  RaiffeisenAppTests
//
//  Created by Cristian Petra on 27.07.26.
//

import Testing
import Model
import Networking
@testable import RaiffeisenApp
import Foundation

@MainActor
struct UserDetailViewModelTests {
    
    @Test("Header properties format full name, username, email, avatar, and initial correctly")
    func testHeaderProperties() {
        // Given
        let user = MockUser.sampleUser1
        let viewModel = UserDetailViewModel(user: user)

        // Then
        #expect(viewModel.fullName == "Miss Laura Woods")
        #expect(viewModel.username == "angryostrich988")
        #expect(viewModel.email == "laura.woods@example.com")
        #expect(viewModel.avatarURL == URL(string: "https://randomuser.me/api/portraits/women/88.jpg")!)
        #expect(viewModel.initial == "L")
    }
    
    @Test("ViewModel generates all four sections in expected order")
    func testSectionTitles() {
        let viewModel = UserDetailViewModel(user: MockUser.sampleUser1)
        let titles = viewModel.sections.map(\.title)

        #expect(titles == ["Contact", "Personal", "Location", "Account"])
    }

}
