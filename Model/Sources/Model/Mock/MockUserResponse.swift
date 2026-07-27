//
//  MockUserResponse.swift
//  Model
//
//  Created by Cristian Petra on 27.07.26.
//

import Foundation

public enum MockUserResponse {
    
    /// Default mock response using standard sample users
    public static var defaultResponse: UserResponse {
        make()
    }
    
    /// Empty response useful for testing empty states
    public static var emptyResponse: UserResponse {
        make(users: [], page: 0)
    }

    /// Flexible builder to customize page, count, or list of users dynamically
    public static func make(
        users: [User] = MockUser.samples,
        page: Int = 1,
        seed: String = "abc",
        version: String = "1.4"
    ) -> UserResponse {
        UserResponse(
            results: users,
            info: UserResponse.ResponseInfo(
                seed: seed,
                results: users.count,
                page: page,
                version: version
            )
        )
    }
}
