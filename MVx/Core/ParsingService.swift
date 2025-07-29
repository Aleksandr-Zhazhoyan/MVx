//
//  ParsingService.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import Foundation

public protocol ParsingServicing {
    func decode<T: Decodable>(_ data: Data, to type: T.Type) -> T?
}

public final class JSONParsingService: ParsingServicing {
    public init() {}
    
    public func decode<T: Decodable>(_ data: Data, to type: T.Type) -> T? {
        try? JSONDecoder().decode(type, from: data)
    }
}
