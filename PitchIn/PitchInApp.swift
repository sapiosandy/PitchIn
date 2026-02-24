//
//  PitchInApp.swift
//  PitchIn
//
//  Created by Sandra Gomez on 6/28/23.
//

import SwiftUI
import SwiftData

@main
struct PitchInApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
