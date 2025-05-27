//
//  Inject.swift
//  TandemCore
//
//  Created by Tandem on 30/03/2025.
//

import Foundation

/// Property wrapper for dependency injection
@propertyWrapper
public struct DIInject<T> {
    private let factory: DIFactory<T>
    public var wrappedValue: T

    public init(factory: DIFactory<T>) {
        self.factory = factory
        self.wrappedValue = factory()
    }
    
    public init(_ keyPath: KeyPath<DIContainer, DIFactory<T>>) {
        self.factory = DIContainer.shared[keyPath: keyPath]
        self.wrappedValue = factory()
    }
}
