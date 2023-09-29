//
//  RootView.swift
//  Thod
//
//  Created by Ashtyn Morel-Blake on 9/24/23.
//

import SwiftUI
import GoTrue

struct RootView: View {
    @State var authEvent: AuthChangeEvent?
    @EnvironmentObject var auth: AuthController
    @StateObject private var coordinator = Coordinator()
    
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            
            Group {
                if authEvent == .signedOut {
                    AuthView()
                } else {
                    HomeView()
                }
            }.task {
                for await event in supabase.auth.authEventChange {
                    withAnimation {
                        authEvent = event
                    }
                    
                    auth.session = try? await supabase.auth.session
                }
            }
        }.environmentObject(coordinator)
    }
}

#Preview {
    RootView()
}
