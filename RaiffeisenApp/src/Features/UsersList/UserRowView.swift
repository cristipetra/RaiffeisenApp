//
//  UserRowView.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 24.07.26.
//

import SwiftUI
import Model

struct UserRowView: View {

    let user: User

    private static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()

    var body: some View {
        HStack(spacing: 12) {
            avatar

            VStack(alignment: .leading, spacing: 2) {
                Text(fullName)
                    .font(.system(size: 18))
                    .foregroundStyle(.primary)
                    .lineLimit(1)

                Text(user.email)
                    .font(.system(size: 15))
                    .foregroundStyle(.secondary)
                    .lineLimit(1)
            }

            Spacer(minLength: 8)

            VStack(alignment: .trailing, spacing: 8) {
                Text(Self.timeFormatter.string(from: user.registered.date))
                    .font(.system(size: 14))
                    .foregroundStyle(.secondary)

                Image(systemName: "star")
                    .font(.system(size: 16))
                    .foregroundStyle(.secondary)
            }
        }
        .padding(.vertical, 6)
    }

    // MARK: - Avatar

    private var avatar: some View {
        AsyncImage(url: user.picture.medium) { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFill()
            default:
                initialsPlaceholder
            }
        }
        .frame(width: 52, height: 52)
        .clipShape(Circle())
    }

    private var initialsPlaceholder: some View {
        ZStack {
            Circle()
                .fill(Color(red: 247/255, green: 202/255, blue: 62/255))
            Text(initial)
                .font(.system(size: 20, weight: .medium))
                .foregroundStyle(.black)
        }
    }

    // MARK: - Helpers

    private var fullName: String {
        "\(user.name.first) \(user.name.last)"
    }

    private var initial: String {
        String(user.name.first.prefix(1)).uppercased()
    }
}

#Preview {
    List {
        UserRowView(user: MockUser.sampleUser1)
        UserRowView(user: MockUser.sampleUser2)
    }
    .listStyle(.plain)
}
