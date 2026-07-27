//
//  UserDetailViewModel.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 27.07.26.
//

import Foundation
import Model

struct UserDetailItem: Identifiable {
    let icon: String
    let label: String
    let value: String

    var id: String { label }
}

struct UserDetailSection: Identifiable {
    let title: String
    let items: [UserDetailItem]

    var id: String { title }
}

protocol UserDetailViewModelling: Observable {
    var fullName: String { get }
    var username: String { get }
    var email: String { get }
    var avatarURL: URL { get }
    var initial: String { get }
    var sections: [UserDetailSection] { get }
}

@Observable
@MainActor
final class UserDetailViewModel: UserDetailViewModelling {

    private let user: User

    init(user: User) {
        self.user = user
    }

    // MARK: - Header

    var fullName: String {
        "\(user.name.title) \(user.name.first) \(user.name.last)"
    }

    var username: String { user.login.username }

    var email: String { user.email }

    var avatarURL: URL { user.picture.large }

    var initial: String {
        String(user.name.first.prefix(1)).uppercased()
    }

    // MARK: - Sections

    var sections: [UserDetailSection] {
        [contactSection, personalSection, locationSection, accountSection]
    }

    private var contactSection: UserDetailSection {
        UserDetailSection(title: "Contact", items: [
            UserDetailItem(icon: "envelope", label: "Email", value: user.email),
            UserDetailItem(icon: "phone", label: "Phone", value: user.phone),
            UserDetailItem(icon: "iphone", label: "Cell", value: user.cell)
        ])
    }

    private var personalSection: UserDetailSection {
        var items: [UserDetailItem] = [
            UserDetailItem(icon: "person", label: "Gender", value: user.gender.rawValue.capitalized),
            UserDetailItem(icon: "calendar", label: "Date of Birth", value: dateOfBirth),
            UserDetailItem(icon: "flag", label: "Nationality", value: user.nat)
        ]
        if let idValue = user.identification.value, !idValue.isEmpty {
            items.append(UserDetailItem(icon: "number", label: idLabel, value: idValue))
        }
        return UserDetailSection(title: "Personal", items: items)
    }

    private var locationSection: UserDetailSection {
        UserDetailSection(title: "Location", items: [
            UserDetailItem(icon: "house", label: "Street", value: street),
            UserDetailItem(icon: "building.2", label: "City", value: user.location.city),
            UserDetailItem(icon: "map", label: "State", value: user.location.state),
            UserDetailItem(icon: "globe", label: "Country", value: user.location.country),
            UserDetailItem(icon: "mail.stack", label: "Postcode", value: user.location.postcode),
            UserDetailItem(icon: "location", label: "Coordinates", value: coordinates),
            UserDetailItem(icon: "clock", label: "Timezone", value: timezone)
        ])
    }

    private var accountSection: UserDetailSection {
        UserDetailSection(title: "Account", items: [
            UserDetailItem(icon: "at", label: "Username", value: user.login.username),
            UserDetailItem(icon: "clock.arrow.circlepath", label: "Registered", value: registered)
        ])
    }

    // MARK: - Derived values

    private var street: String {
        "\(user.location.street.number) \(user.location.street.name)"
    }

    private var coordinates: String {
        "\(user.location.coordinates.latitude), \(user.location.coordinates.longitude)"
    }

    private var timezone: String {
        "\(user.location.timezone.offset) · \(user.location.timezone.description)"
    }

    private var dateOfBirth: String {
        "\(Self.dateFormatter.string(from: user.dob.date)) (\(user.dob.age) yrs)"
    }

    private var registered: String {
        "\(Self.dateFormatter.string(from: user.registered.date)) (\(user.registered.age) yrs ago)"
    }

    private var idLabel: String {
        user.identification.name.isEmpty ? "ID" : user.identification.name
    }

    private static let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
}
