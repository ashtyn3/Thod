//
//  ThodApp.swift
//  Thod
//
//  Created by Ashtyn Morel-Blake on 9/24/23.
//

import SwiftUI
import SwiftData
import Supabase

enum Secrets {
  static let supabaseURL = URL(string: "https://vpvtihsmaammrhhwhkzy.supabase.co")!
  static let supabaseAnonKey = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InZwdnRpaHNtYWFtbXJoaHdoa3p5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE2ODg3NjE0NzEsImV4cCI6MjAwNDMzNzQ3MX0.yfE1yaBNg36MfYQYSD9A47gJNGTJLVxR8PtdFjJx4LE"
}

final class AuthController: ObservableObject {
  @Published var session: Session?

  var currentUserID: UUID {
    guard let id = session?.user.id else {
      preconditionFailure("Required session.")
    }

    return id
  }
}

@main
struct ThodApp: App {
    @State var supabaseInitialized = false;
    @StateObject var auth = AuthController()

    var body: some Scene {
        WindowGroup {
            main
        }
    }
    
    @ViewBuilder
    var main: some View {
       if supabaseInitialized {
         RootView()
           .environmentObject(auth)
       } else {
         ProgressView()
           .task {
             await supabase.auth.initialize()
             supabaseInitialized = true
           }
       }
     }
}

let supabase = SupabaseClient(
  supabaseURL: Secrets.supabaseURL,
  supabaseKey: Secrets.supabaseAnonKey
)
