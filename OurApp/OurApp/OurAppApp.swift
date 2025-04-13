//
//  OurAppApp.swift
//  OurApp
//
//  Created by Elena Marquez on 4/12/25.
//

import SwiftUI
import SwiftData

@main
struct OurAppApp: App {
    @StateObject var parentManager = ParentManager()
    @StateObject var userManager = UserManager()
    
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Item.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            WelcomeScreen()
        }
        .modelContainer(sharedModelContainer)
    }
}
