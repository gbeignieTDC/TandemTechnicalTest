//
//  DIWeakScope.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

/// A scope that keeps instances weakly referenced
class DIWeakScope: DIScope {
    var type: ScopeType { .weak }
    var instance: DIAnyInstance?

    func resolve<T>(factory: () -> T) -> T? {
        let value = resolveInstance(factory: factory)
        if let object = value as? AnyObject {
            instance = DIWeakInstance(value: object)
        }
        return value
    }
}
