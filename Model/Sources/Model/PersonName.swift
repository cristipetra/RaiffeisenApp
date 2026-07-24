import Foundation

/// A user's title and full name.
public struct PersonName: Codable, Hashable, Sendable {
    public let title: String
    public let first: String
    public let last: String

    public init(title: String, first: String, last: String) {
        self.title = title
        self.first = first
        self.last = last
    }
}
