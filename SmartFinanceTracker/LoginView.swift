//
//  LoginView.swift
//  SmartFinanceTracker
//
//  Created by Greg Kabakian on 3/14/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email = ""
    @State private var password = ""
    @State private var errorMessage = ""
    
    var body: some View {
        VStack {
            Text("Smart Finance Tracker")
                .font(.largeTitle)
                .bold()
                .padding()

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            if !errorMessage.isEmpty {
                Text(errorMessage)
                    .foregroundColor(.red)
            }

            Button("Login") {
                authManager.login(email: email, password: password) { result in
                    switch result {
                    case .success:
                        print("Login Successful!")
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                    }
                }
            }
            .buttonStyle(.borderedProminent)
            .padding()

            Button("Register") {
                authManager.register(email: email, password: password) { result in
                    switch result {
                    case .success:
                        print("Registration Successful!")
                    case .failure(let error):
                        errorMessage = error.localizedDescription
                    }
                }
            }
            .buttonStyle(.bordered)
            .padding()
        }
    }
}
