//
//  PokeTestApp.swift
//  PokeTest
//
//  Created by Tandem on 21.05.2025.
//

import SwiftUI

@main
struct PokeTestApp: App {
    var body: some Scene {
        WindowGroup {
            ListView(viewModel: ListViewModel())
        }
    }
}
