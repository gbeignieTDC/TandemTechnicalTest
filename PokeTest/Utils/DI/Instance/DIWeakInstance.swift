//
//  DIWeakInstance.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

/// A weakly referenced instance stored in a scope.
/// Allows the instance to be deallocated when not strongly referenced elsewhere.
internal final class DIWeakInstance: DIAnyInstance {
    /// Stores a weak reference to the instance
    weak var value: AnyObject?

    init(value: AnyObject? = nil) {
        self.value = value
    }
}
