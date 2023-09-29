//
//  ContentView.swift
//  Thod
//
//  Created by Ashtyn Morel-Blake on 9/24/23.
//

import SwiftUI
import SwiftData

struct AuthView: View {
    @State var emailMode = false;
    var body: some View {
        Group {
            
            if !emailMode {
                VStack {
                    Image(uiImage: UIImage(named:"AppIcon") ?? UIImage()).resizable().frame(width:200, height: 200).padding(.bottom)
                    Group {
                        Text("Welcome to the ") +
                        Text("Listening").foregroundStyle(Color(.red)) +
                        Text(" place.")
                    }.font(.title)
                    
                    Button(action: emailSignUp) {
                        Text("Sign up with Email").font(.title2).foregroundStyle(Color(.black)).padding()
                    }.overlay(RoundedRectangle(cornerRadius: 40).stroke(.black, lineWidth: 2))
                    
                    Button(action: signUp) {
                        Text("Sign up with Twitter").font(.title2).foregroundStyle(Color(.black)).padding()
                    }.overlay(RoundedRectangle(cornerRadius: 40).stroke(.black, lineWidth: 2))
                }.padding()
            } else {
                EmailAuthView()
            }
        }
    }
    func emailSignUp() {
        emailMode = true;
    }
    
    func signUp() {
    }
    
}

#Preview {
    AuthView()
}
