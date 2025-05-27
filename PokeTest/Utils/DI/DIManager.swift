//
//  DIManager.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

import Foundation

/// Manager for handling dependency instances and scopes
class DIManager: @unchecked Sendable {
    private var lock: NSLock = NSLock()
    private var factories: [String: DIAnyFactory] = [:]
    private var scopes: [String: DIScope] = [:]

    /// Retrieves a scope for a given key
    func scope(key: String) -> DIScope? {
        defer { lock.unlock() }
        lock.lock()
        return scopes[key]
    }

    /// Registers a scope for a specific key
    func set(scope: DIScope, for key: String) {
        defer { lock.unlock() }
        lock.lock()
        if let currentScope = scopes[key] {
            if currentScope.type != scope.type {
                scopes[key] = scope
            }
        } else {
            scopes[key] = scope
        }
    }

    /// Retrieves a factory for a given key
    func factory(key: String) -> DIAnyFactory? {
        defer { lock.unlock() }
        lock.lock()
        return factories[key]
    }

    /// Registers a factory and removes any existing scope
    func set(factory: DIAnyFactory, for key: String) {
        defer { lock.unlock() }
        lock.lock()
        factories[key] = factory
        scopes.removeValue(forKey: key)
    }
}
