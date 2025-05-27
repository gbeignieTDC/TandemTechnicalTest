//
//  DIScope.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

/// Protocol defining a scope behavior for dependency resolution
public protocol DIScope {
    /// Defines whether the scope is strong or weak
    var type: ScopeType { get }

    /// Holds the stored instance (if any)
    var instance: DIAnyInstance? { get }

    /// Resolves an instance using a factory
    func resolve<T>(factory: () -> T) -> T?
}

/// Extension to provide default behavior for resolving instances within a scope
extension DIScope {
    /// Checks if an instance already exists within the scope and returns it if available.
    /// If no instance is stored, it creates a new one using the factory.
    func resolveInstance<T>(factory: () -> T) -> T? {
        if let instance = instance {
            if let strongInstance = (instance as? DIStrongInstance)?.value as? T {
                return strongInstance
            } else if let weakInstance = (instance as? DIWeakInstance)?.value as? T {
                return weakInstance
            }
        }
        return factory()
    }
}
