//
//  UsersListView.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 24.07.26.
//

import SwiftUI
import Model

struct UsersListView<VM: UsersListViewModelling>: View {
    
    @State var viewModel: VM
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                UserRowView(user: user)
                    .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    .listRowSeparator(.visible)
                    .onAppear {
                        viewModel.onUserRowAppeared(user)
                    }
            }
            .listStyle(.plain)
            .overlay {
                if viewModel.isLoading {
                    ProgressView("Loading users...")
                        .controlSize(.large)
                        .tint(Color(red: 247/255, green: 202/255, blue: 62/255))
                } else if viewModel.users.isEmpty {
                    ContentUnavailableView(
                        "No Users",
                        systemImage: "person.slash",
                        description: Text("There are no users to display right now.")
                    )
                }
            }
            .alert(
                "Error",
                isPresented: Binding(
                    get: { !viewModel.errorMessage.isEmpty },
                    set: { isPresented in
                        if !isPresented { viewModel.errorMessage = "" }
                    }
                )
            ) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(viewModel.errorMessage)
            }
            
            // MARK: - Navigation Bar Configuration
            .navigationTitle("Users")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
             
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                }
            }
            .toolbarBackground(Color(red: 247/255, green: 202/255, blue: 62/255), for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.light, for: .navigationBar)
        }
        .task {
            await viewModel.fetchUsers()
        }
    }
}

//#Preview {
//    UsersListView()
//}
