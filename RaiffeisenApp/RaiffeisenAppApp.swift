//
//  RaiffeisenAppApp.swift
//  RaiffeisenApp
//
//  Created by Cristian Petra on 23.07.26.
//

import SwiftUI

@main
struct RaiffeisenAppApp: App {
    
    @State private var appDIContainer = AppDependencyContainer()
    
    var body: some Scene {
        WindowGroup {
            AppRootView(container: appDIContainer)
        }
    }
}
