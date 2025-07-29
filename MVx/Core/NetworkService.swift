//
//  NetworkService.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

import Foundation

public protocol NetworkServicing {
    func fetchData(from url: URL, completion: @escaping (Data?) -> Void)
}

public final class NetworkService: NetworkServicing {
    public init() {}
    
    public func fetchData(from url: URL, completion: @escaping (Data?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            completion(data)
        }.resume()
    }
}
