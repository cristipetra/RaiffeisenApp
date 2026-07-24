import Foundation

/// The set of profile picture URLs available for a user.
public struct ImageSet: Codable, Hashable, Sendable {
    public let large: URL
    public let medium: URL
    public let thumbnail: URL

    public init(large: URL, medium: URL, thumbnail: URL) {
        self.large = large
        self.medium = medium
        self.thumbnail = thumbnail
    }
}
