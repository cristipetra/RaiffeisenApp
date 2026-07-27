//
//  UserDetailView.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 27.07.26.
//

import SwiftUI
import Model

struct UserDetailView<VM: UserDetailViewModelling>: View {

    let viewModel: VM

    private static var brandYellow: Color { Color(red: 247/255, green: 202/255, blue: 62/255) }

    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                header

                ForEach(viewModel.sections) { section in
                    InfoSection(title: section.title) {
                        ForEach(section.items) { item in
                            InfoRow(icon: item.icon, label: item.label, value: item.value)
                        }
                    }
                }
            }
            .padding()
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle(viewModel.fullName)
        .navigationBarTitleDisplayMode(.inline)
    }

    // MARK: - Header

    private var header: some View {
        VStack(spacing: 12) {
            AsyncImage(url: viewModel.avatarURL) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFill()
                default:
                    ZStack {
                        Circle().fill(Self.brandYellow)
                        Text(viewModel.initial)
                            .font(.system(size: 44, weight: .medium))
                            .foregroundStyle(.black)
                    }
                }
            }
            .frame(width: 128, height: 128)
            .clipShape(Circle())
            .overlay(Circle().stroke(Self.brandYellow, lineWidth: 4))

            VStack(spacing: 4) {
                Text(viewModel.fullName)
                    .font(.title2.weight(.semibold))
                    .multilineTextAlignment(.center)

                Text("@\(viewModel.username)")
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text(viewModel.email)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

// MARK: - Reusable components

private struct InfoSection<Content: View>: View {
    let title: String
    @ViewBuilder let content: Content

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text(title.uppercased())
                .font(.caption.weight(.semibold))
                .foregroundStyle(.secondary)
                .padding(.leading, 4)
                .padding(.bottom, 8)

            VStack(spacing: 0) {
                content
            }
            .background(Color(.secondarySystemGroupedBackground))
            .clipShape(RoundedRectangle(cornerRadius: 12))
        }
    }
}

private struct InfoRow: View {
    let icon: String
    let label: String
    let value: String

    var body: some View {
        VStack(spacing: 0) {
            HStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 16))
                    .foregroundStyle(.secondary)
                    .frame(width: 24)

                Text(label)
                    .foregroundStyle(.secondary)

                Spacer(minLength: 12)

                Text(value)
                    .multilineTextAlignment(.trailing)
                    .foregroundStyle(.primary)
                    .textSelection(.enabled)
            }
            .font(.subheadline)
            .padding(.horizontal, 16)
            .padding(.vertical, 12)

            Divider().padding(.leading, 52)
        }
    }
}

#Preview {
    NavigationStack {
        UserDetailView(viewModel: UserDetailViewModel(user: MockUser.sampleUser1))
    }
}
