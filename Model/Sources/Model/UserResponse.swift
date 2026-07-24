import Foundation

/// The top-level payload returned by the users endpoint.
public struct UserResponse: Codable, Hashable, Sendable {
    public let results: [User]
    public let info: ResponseInfo

    public init(results: [User], info: ResponseInfo) {
        self.results = results
        self.info = info
    }

    /// Metadata describing the response.
    public struct ResponseInfo: Codable, Hashable, Sendable {
        public let seed: String
        public let results: Int
        public let page: Int
        public let version: String

        public init(seed: String, results: Int, page: Int, version: String) {
            self.seed = seed
            self.results = results
            self.page = page
            self.version = version
        }
    }
}
