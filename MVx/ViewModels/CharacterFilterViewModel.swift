//
//  CharacterFilterViewModel.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import Foundation
import Combine

final class CharacterFilterViewModel: ObservableObject {
    @Published var searchText: String = ""
}
