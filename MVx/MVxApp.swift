//
//  MVxApp.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import SwiftUI
import CoreServices

@main
struct MVxApp: App {
    
    init() {
        ServiceLocator.shared.register(NetworkService() as NetworkServicing)
        ServiceLocator.shared.register(JSONParsingService() as ParsingServicing)
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
