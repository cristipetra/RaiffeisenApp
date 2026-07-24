import Foundation

/// A timezone described by its UTC offset and a human-readable description.
public struct Timezone: Codable, Hashable, Sendable {
    public let offset: String
    public let description: String

    public init(offset: String, description: String) {
        self.offset = offset
        self.description = description
    }
}
