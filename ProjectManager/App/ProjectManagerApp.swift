//
//  ProjectManagerApp.swift
//  ProjectManager
//
//  Created by Thomas Ostermann on 03.01.21.
//

import SwiftUI
import Firebase

@main
struct ProjectManagerApp: App {
    var body: some Scene {
        FirebaseApp.configure()
        Auth.auth().signInAnonymously()
        return WindowGroup {
            ProjectListView()
        }
    }
}
