//
//  ServiceLocator.swift
//  MVx
//
//  Created by Aleksandr Zhazhoyan on 28.07.2025.
//

public final class ServiceLocator {
    public static let shared = ServiceLocator()
    private var services: [ObjectIdentifier: Any] = [:]
    
    private init() {}
    
    public func register<T>(_ service: T) {
        let key = ObjectIdentifier(T.self)
        services[key] = service
    }
    
    public func resolve<T>() -> T {
        let key = ObjectIdentifier(T.self)
        guard let service = services[key] as? T else {
            fatalError("Servicefor type \(T.self) not registered")
        }
        return service
    }
}
