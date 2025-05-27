//
//  DIStrongInstance.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

/// A strongly referenced instance stored in a scope.
internal final class DIStrongInstance: DIAnyInstance {
    /// Stores the instance/
    var value: Any

    init(value: Any) {
        self.value = value
    }
}
