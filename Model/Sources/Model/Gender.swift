import Foundation

/// The gender of a user as reported by the API.
///
/// Any value not recognized by the app decodes to `.unknown` so that decoding
/// never fails on an unexpected or empty value.
public enum Gender: String, Codable, Hashable, Sendable {
    case female
    case male
    case unknown

    public init(from decoder: any Decoder) throws {
        let rawValue = try decoder.singleValueContainer().decode(String.self)
        self = Gender(rawValue: rawValue) ?? .unknown
    }
}
