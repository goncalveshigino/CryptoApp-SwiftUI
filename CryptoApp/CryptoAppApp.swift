//
//  CryptoAppApp.swift
//  CryptoApp
//
//  Created by Goncalves Higino on 17/11/23.
//

import SwiftUI

@main
struct CryptoAppApp: App {
    
    @StateObject private var vm = HomeViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
        }
    }
}
