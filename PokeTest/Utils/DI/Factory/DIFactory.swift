//
//  DIFactory.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

import Foundation

/// A generic dependency factory that registers and resolves instances of type `T`
public class DIFactory<T> {
    /// Reference to the DI container
    let container: DIContainer

    /// The closure that provides instances
    let provider: (() -> T)

    /// Initializes the factory with a container and a provider function
    public init(container: DIContainer, provider: @escaping () -> T) {
        self.container = container
        self.provider = provider
    }
    
    public func callAsFunction() -> T {
        resolve()
    }

    /// Registers a provider function to the container.
    /// - Returns: The current factory instance for chaining.
    @discardableResult
    public func register(provider: @Sendable @escaping () -> T) -> Self {
        let key = String(describing: T.self)
        defer { container.locker.lock(key: key).unlock() }
        container.locker.lock(key: key).lock()
        container.manager.set(factory: DITypedFactory(factory: { provider() }), for: key)
        return self
    }

    /// Resolves an instance of `T`, considering the registered scope.
    /// - Returns: The resolved instance.
    public func resolve() -> T {
        let key = String(describing: T.self)
        defer { container.locker.lock(key: key).unlock() }
        container.locker.lock(key: key).lock()
        if let factory = container.manager.factory(key: key) as? DITypedFactory<T> {
            if let option = container.manager.scope(key: key),
                let object = option.resolve(factory: factory.factory) {
                return object
            }
            return factory.factory()
        } else if let option = container.manager.scope(key: key),
                  let object = option.resolve(factory: provider) {
                  return object
        } else {
            return provider()
        }
    }

    /// Assigns a custom scope (strong or weak) to this factory.
    /// - Returns: The current factory instance for chaining.
    @discardableResult
    public func scope(_ scope: DIScope) -> Self {
        container.manager.set(scope: scope, for: String(describing: T.self))
        return self
    }

    /// Registers the instance with a strong scope, ensuring it is retained.
    @discardableResult
    public func strong() -> Self {
        container.manager.set(scope: DIStrongScope(), for: String(describing: T.self))
        return self
    }

    /// Registers the instance with a weak scope, allowing it to be deallocated if not strongly referenced elsewhere.
    @discardableResult
    public func weak() -> Self {
        container.manager.set(scope: DIWeakScope(), for: String(describing: T.self))
        return self
    }
}
