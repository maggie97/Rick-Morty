//
//  Ricky_MortyApp.swift
//  Ricky&Morty
//
//  Created by MaggieMendez  on 24/10/21.
//

import SwiftUI
import Firebase

@main
struct Ricky_MortyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
