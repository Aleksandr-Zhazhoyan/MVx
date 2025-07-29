//
//  APIResponse.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

public struct APIResponse<T: Decodable>: Decodable {
    public let results: [T]
    public init(results: [T]) {
        self.results = results
    }
}
