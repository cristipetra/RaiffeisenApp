import Foundation

/// A single user returned by the API.
public struct User: Codable, Hashable, Identifiable, Sendable {
    public let gender: Gender
    public let name: PersonName
    public let location: PostalAddress
    public let email: String
    public let login: AuthenticationInfo
    public let dob: DateInfo
    public let registered: DateInfo
    public let phone: String
    public let cell: String
    public let identification: IdentificationDocument
    public let picture: ImageSet
    public let nat: String
    
    public var id: UUID { login.uuid }

    public init(
        gender: Gender,
        name: PersonName,
        location: PostalAddress,
        email: String,
        login: AuthenticationInfo,
        dob: DateInfo,
        registered: DateInfo,
        phone: String,
        cell: String,
        identification: IdentificationDocument,
        picture: ImageSet,
        nat: String
    ) {
        self.gender = gender
        self.name = name
        self.location = location
        self.email = email
        self.login = login
        self.dob = dob
        self.registered = registered
        self.phone = phone
        self.cell = cell
        self.identification = identification
        self.picture = picture
        self.nat = nat
    }

    private enum CodingKeys: String, CodingKey {
        case gender
        case name
        case location
        case email
        case login
        case dob
        case registered
        case phone
        case cell
        case identification = "id"
        case picture
        case nat
    }
}
