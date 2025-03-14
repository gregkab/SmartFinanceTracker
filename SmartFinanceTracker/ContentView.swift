//
//  ContentView.swift
//  SmartFinanceTracker
//
//  Created by Greg Kabakian on 3/13/25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        if authManager.user == nil {
            LoginView()
        } else {
            ExpenseListView()

        }
    }
}


