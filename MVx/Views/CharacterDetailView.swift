//
//  CharacterDetailView.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import SwiftUI

struct CharacterDetailView: View {
    let character: Character
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Character Detail")
                .font(.title)
                .bold()
            Text("ID: \(character.id)")
            Text("Name: \(character.name)")
        }
        .padding()
        .navigationTitle(character.name)
    }
}
