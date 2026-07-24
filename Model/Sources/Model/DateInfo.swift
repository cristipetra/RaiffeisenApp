import Foundation

/// A date paired with an age in years, used for `dob` and `registered`.
public struct DateInfo: Codable, Hashable, Sendable {
    public let date: Date
    public let age: Int

    public init(date: Date, age: Int) {
        self.date = date
        self.age = age
    }

    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        age = try container.decode(Int.self, forKey: .age)

        // The API returns ISO 8601 timestamps with fractional seconds, e.g.
        // "1967-07-23T09:18:33.666Z", which the default strategies don't parse.
        let rawDate = try container.decode(String.self, forKey: .date)
        guard let parsed = DateInfo.formatter.date(from: rawDate) else {
            throw DecodingError.dataCorruptedError(
                forKey: .date,
                in: container,
                debugDescription: "Invalid ISO 8601 date: \(rawDate)"
            )
        }
        date = parsed
    }

    public func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(age, forKey: .age)
        try container.encode(DateInfo.formatter.string(from: date), forKey: .date)
    }

    private enum CodingKeys: String, CodingKey {
        case date
        case age
    }

    private static var formatter: ISO8601DateFormatter {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter
    }
}
