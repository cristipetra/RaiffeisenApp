//
//  UsersListView.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 24.07.26.
//

import SwiftUI

struct UsersListView: View {
    
    @State var viewModel: UsersListViewModelling
    
    public init(viewModel: UsersListViewModelling) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        NavigationStack {
            List(viewModel.users) { user in
                UserRowView(user: user)
                    .listRowInsets(EdgeInsets(top: 4, leading: 16, bottom: 4, trailing: 16))
                    .listRowSeparator(.visible)
            }
            .listStyle(.plain)
            
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
