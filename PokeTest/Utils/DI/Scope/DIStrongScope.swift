//
//  DIStrongScope.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

/// A scope that keeps instances strongly referenced
final class DIStrongScope: DIScope {
    var type: ScopeType { .strong }
    var instance: DIAnyInstance?

    func resolve<T>(factory: () -> T) -> T? {
        let value = resolveInstance(factory: factory)
        if let object = value {
            instance = DIStrongInstance(value: object)
        }
        return value
    }
}
