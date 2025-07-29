//
//  CharacterListViewModel.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import Foundation
import Combine

final class CharacterListViewModel: ObservableObject {
    @Published var characters: [Character] = []
    @Published var selectedCharacter: Character?
    @Published var animateId: Int?
    
    let filterVM = CharacterFilterViewModel()
    
    private let networkService: NetworkServicing
    private let parsingService: ParsingServicing
    
    init(networkService: NetworkServicing, parsingService: ParsingServicing) {
        self.networkService = networkService
        self.parsingService = parsingService
        loadCharacters()
    }
    
    func loadCharacters() {
        guard let url = URL(string: "https://rickandmortyapi.com/api/character") else { return }
        
        networkService.fetchData(from: url) { [weak self] data in
            guard let self = self,
                  let data = data,
                  let result = self.parsingService.decode(data, to: APIResponse<Character>.self) else { return }
            DispatchQueue.main.async{
                self.characters = result.results
            }
        }
    }
    
    func select(character: Character) {
        animateId = character.id
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
            self.selectedCharacter = character
        }
    }
    
    func resetSelection() {
        selectedCharacter = nil
    }
}
