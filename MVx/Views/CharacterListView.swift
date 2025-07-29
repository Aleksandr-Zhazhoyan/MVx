//
//  CharacterListView.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import SwiftUI
import CoreServices

struct CharacterListView: View {
    @StateObject var viewModel: CharacterListViewModel
    
    var body: some View {
        List(viewModel.characters) { character in
            Text(character.name)
                .scaleEffect(viewModel.animateId == character.id ? 0.1 : 1)
                .offset(y: viewModel.animateId == character.id ? 300 : 0)
                .animation(.easeIn(duration: 0.6), value: viewModel.animateId)
                .onTapGesture {
                    viewModel.select(character: character)
                }
                .background(
                    NavigationLink("", destination: CharacterDetailView(character: character), isActive: Binding(
                        get: { viewModel.selectedCharacter?.id == character.id },
                        set: { isAcive in
                            if !isAcive { viewModel.resetSelection()}
                        }
                    ))
                    .opacity(0)
                )
        }
        //.onAppear(perform: loadCharacters)
    }
    
//    func loadCharacters() {
//        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
//        
//        networkService.fetchData(from: url) { [weak self] data in
//            guard let self = self,
//                  let data = data,
//                  let result = self.parsingService.decode(data, to: APIResponse<Character>.self) else { return }
//
//            DispatchQueue.main.async {
//                self.characters = result.results
//            }
//        }
//
//    }
}
