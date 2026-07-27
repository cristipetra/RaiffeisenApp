import Foundation

/// A national identification document. The API may return an empty `name`
/// and a `null` `value` when no identifier is available.
public struct IdentificationDocument: Codable, Hashable, Sendable {
    public let name: String
    public let value: String?

    public init(name: String, value: String?) {
        self.name = name
        self.value = value
    }
}
