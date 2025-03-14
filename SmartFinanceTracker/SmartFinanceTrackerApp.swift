//
//  SmartFinanceTrackerApp.swift
//  SmartFinanceTracker
//
//  Created by Greg Kabakian on 3/13/25.
//

import SwiftUI
import FirebaseCore

@main
struct SmartFinanceTrackerApp: App {
    // Register the AppDelegate for Firebase setup
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}

// AppDelegate for Firebase setup
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
