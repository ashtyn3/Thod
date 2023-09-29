//
//  EmailAuthView.swift
//  Thod
//
//  Created by Ashtyn Morel-Blake on 9/24/23.
//

import SwiftUI
import GoTrue

struct EmailAuthView: View {
    @State var email: String = "";
    @State var password: String = "";
    @State var errorMsg: String = "";
    @State var isAuth: Bool = false;
    @StateObject private var coordinator = Coordinator()

    var body: some View {
        HStack {
            Group {
                Text("T").foregroundStyle(Color(.green)) +
                Text("H").foregroundStyle(Color(.blue)) +
                Text("O").foregroundStyle(Color(.orange)) +
                Text("D").foregroundStyle(Color(.red))
            }.font(.title)
        }.frame(alignment: .top)
        Spacer()
        VStack {
            Text("We're excited to have you here!").font(.title2).frame(width: 200).padding(.bottom, 30)
            Group {
                if (errorMsg != "") {
                    Text(errorMsg).foregroundStyle(Color(.red))
                }
            }
            TextField("Email", text: $email).textInputAutocapitalization(.never).textContentType(.emailAddress).keyboardType(.emailAddress).autocorrectionDisabled().frame(width: 220)
            Divider().frame(width: 220).padding(.bottom)
            SecureField("Password", text: $password).textContentType(.password).autocorrectionDisabled().textInputAutocapitalization(.never).frame(width: 220).padding(.top)
            Divider().frame(width: 220)
            Button("Sign up") {
                Task {
                    await auth()
                }
            }
        }
        Spacer()

    }
    
    func auth() async {
        do {
            try await supabase.auth.signUp(email: email, password: password)
            coordinator.show(HomeView.self)
        } catch {
            errorMsg = error.localizedDescription;
        }
    }
}

#Preview {
    EmailAuthView(email: "example@example.com", password: "ashtyn")
}
