import Foundation

/// The location / address information for a user.
public struct PostalAddress: Codable, Hashable, Sendable {
    public let street: Street
    public let city: String
    public let state: String
    public let country: String
    /// The API returns this as either a number (e.g. `78276`) or a string (e.g. `"7044 TR"`),
    /// so it is normalized to a `String`.
    public let postcode: String
    public let coordinates: Coordinates
    public let timezone: Timezone

    public init(
        street: Street,
        city: String,
        state: String,
        country: String,
        postcode: String,
        coordinates: Coordinates,
        timezone: Timezone
    ) {
        self.street = street
        self.city = city
        self.state = state
        self.country = country
        self.postcode = postcode
        self.coordinates = coordinates
        self.timezone = timezone
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        street = try container.decode(Street.self, forKey: .street)
        city = try container.decode(String.self, forKey: .city)
        state = try container.decode(String.self, forKey: .state)
        country = try container.decode(String.self, forKey: .country)
        coordinates = try container.decode(Coordinates.self, forKey: .coordinates)
        timezone = try container.decode(Timezone.self, forKey: .timezone)

        // `postcode` can be either an Int or a String depending on nationality.
        if let intValue = try? container.decode(Int.self, forKey: .postcode) {
            postcode = String(intValue)
        } else {
            postcode = try container.decode(String.self, forKey: .postcode)
        }
    }

    /// A street address consisting of a house number and street name.
    public struct Street: Codable, Hashable, Sendable {
        public let number: Int
        public let name: String

        public init(number: Int, name: String) {
            self.number = number
            self.name = name
        }
    }
}
