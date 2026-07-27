//
//  AppRootView.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 24.07.26.
//

import SwiftUI
struct AppRootView: View {
    let container: AppDependencyContainer
    
    var body: some View {
        UsersListView(viewModel: container.makeUsersListViewModel())
    }
}

//#Preview {
//    AppRootView()
//}
