//
//  LanguageManager.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 07.08.2025.
//

import Foundation
import SwiftUI

final class LanguageManager: ObservableObject {
    @Published var selectedLanguage: Language = .device {
        didSet {
            Bundle.setLanguage(selectedLanguage.code)
            objectWillChange.send()
        }
    }
    
    static let shared = LanguageManager()
    
    private init() {
        selectedLanguage = .device
    }
    
    
}

enum Language: String, CaseIterable, Identifiable {
    case device
    case english
    case russian
    
    var id: String {
        rawValue
    }
    
    var code: String {
        switch self {
        case .device: return ""
        case .english: return "en"
        case .russian: return "ru"
        }
    }
    
    var displayName: String {
        switch self {
        case .device: return "🌐 System"
        case .english: return "🇺🇸 English"
        case .russian: return "🇷🇺 Русский"
        }
    }
}
