//
//  MockUser.swift
//  Model
//
//  Created by Cristian Petra on 24.07.26.
//

import Foundation

public enum MockUser {
    
    public static let sampleUser1 = User(
        gender: .female,
        name: PersonName(title: "Miss", first: "Laura", last: "Woods"),
        location: PostalAddress(
            street: PostalAddress.Street(number: 2479, name: "Henry Street"),
            city: "Blessington",
            state: "Wexford",
            country: "Ireland",
            postcode: "78276",
            coordinates: Coordinates(latitude: "2.0565", longitude: "95.2422"),
            timezone: Timezone(offset: "+1:00", description: "Brussels, Copenhagen, Madrid, Paris")
        ),
        email: "laura.woods@example.com",
        login: AuthenticationInfo(
            uuid: UUID(uuidString: "9f07341f-c7e6-45b7-bab0-af6de5a4582d")!,
            username: "angryostrich988",
            password: "racers",
            salt: "B5ywSDUM",
            md5: "2eefb6307df2a5fb1f91c6b968dc905b",
            sha1: "33cbf1e97a31e14c87fb18c481d1f6d958c76cbd",
            sha256: "83e0c89668c8b6131df0c70fc4bb9abb8831e0ff97a0a29cdfa3949dd5afd491"
        ),
        dob: DateInfo(date: date("1967-07-23T09:18:33.666Z"), age: 59),
        registered: DateInfo(date: date("2018-10-18T04:05:51.990Z"), age: 7),
        phone: "031-623-5189",
        cell: "081-807-8083",
        identification: IdentificationDocument(name: "PPS", value: "1101776T"),
        picture: ImageSet(
            large: URL(string: "https://randomuser.me/api/portraits/women/88.jpg")!,
            medium: URL(string: "https://randomuser.me/api/portraits/med/women/88.jpg")!,
            thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/women/88.jpg")!
        ),
        nat: "IE"
    )

    public static let sampleUser2 = User(
        gender: .male,
        name: PersonName(title: "Mr", first: "Marten", last: "Faber"),
        location: PostalAddress(
            street: PostalAddress.Street(number: 6167, name: "Grüner Weg"),
            city: "Falkenberg/Elster",
            state: "Thüringen",
            country: "Germany",
            postcode: "99553",
            coordinates: Coordinates(latitude: "89.4367", longitude: "135.6354"),
            timezone: Timezone(offset: "+5:45", description: "Kathmandu")
        ),
        email: "marten.faber@example.com",
        login: AuthenticationInfo(
            uuid: UUID(uuidString: "1cd1e622-12bb-4b35-a2c9-63ff7bda6c73")!,
            username: "yellowfish737",
            password: "krusty",
            salt: "CQZQxXDl",
            md5: "c875e08220708016989470d12ba1175f",
            sha1: "48f118f603294a09a5cd30b93bca9b08d5abcae5",
            sha256: "2daf436e8b7cd276eaedfd06ced8a8e1938fae2015fb775ac20490d9a92ec3a1"
        ),
        dob: DateInfo(date: date("1960-08-01T11:13:57.264Z"), age: 65),
        registered: DateInfo(date: date("2002-04-03T08:57:47.321Z"), age: 24),
        phone: "0100-8354415",
        cell: "0172-4195644",
        identification: IdentificationDocument(name: "SVNR", value: "18 010860 F 495"),
        picture: ImageSet(
            large: URL(string: "https://randomuser.me/api/portraits/men/1.jpg")!,
            medium: URL(string: "https://randomuser.me/api/portraits/med/men/1.jpg")!,
            thumbnail: URL(string: "https://randomuser.me/api/portraits/thumb/men/1.jpg")!
        ),
        nat: "DE"
    )

    /// A collection of sample users.
    public static let samples: [User] = [sampleUser1, sampleUser2]

    /// A sample top-level response wrapping the sample users.
    public static let sampleResponse = UserResponse(
        results: samples,
        info: UserResponse.ResponseInfo(seed: "abc", results: samples.count, page: 1, version: "1.4")
    )

    private static func date(_ iso: String) -> Date {
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
        return formatter.date(from: iso) ?? Date(timeIntervalSince1970: 0)
    }
}
