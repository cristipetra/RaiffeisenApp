import Foundation

/// Geographic coordinates. The API returns latitude and longitude as strings.
public struct Coordinates: Codable, Hashable, Sendable {
    public let latitude: String
    public let longitude: String

    public init(latitude: String, longitude: String) {
        self.latitude = latitude
        self.longitude = longitude
    }
}
