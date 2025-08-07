//
//  ContentView.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedCategory: Category = .characters
    @StateObject private var characterListVM = CharacterListViewModel(
        networkService: ServiceLocator.shared.resolve(),
        parsingService: ServiceLocator.shared.resolve()
    )
    @State private var languageManager = LanguageManager.shared
    
    var body: some View {
        NavigationStack{
            VStack{
                Picker("Language", selection: $languageManager.selectedLanguage) {
                    ForEach(Language.allCases) { lang in
                        Text(lang.displayName).tag(lang)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                Picker("Category", selection: $selectedCategory) {
                    ForEach(Category.allCases, id: \.self) {
                        Text(NSLocalizedString($0.rawValue, comment: ""))
                    }
                }
                .pickerStyle(.segmented)
                .padding()
                
                switch selectedCategory {
                case .characters:
                    CharacterListView(
                        viewModel: CharacterListViewModel(
                            networkService: ServiceLocator.shared.resolve(),
                            parsingService: ServiceLocator.shared.resolve()
                        )
                    )
                case .locations:
                    SimpleListView(title: "Locations")
                case .episodes:
                    SimpleListView(title: "Episodes")
                }
            }
        }
    }
}

enum Category: String, CaseIterable {
    case characters, locations, episodes
}
