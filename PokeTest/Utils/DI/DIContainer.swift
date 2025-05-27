//
//  DIContainer.swift
//  TandemCore
//
//  Created by Tandem on 30/03/2025.
//

/// Dependency Injection container for managing dependencies
public final class DIContainer: Sendable {
    public static let shared = DIContainer()
    public init() {}

    let locker: DIInstanceLocker = DIInstanceLocker()
    let manager: DIManager = DIManager()

    public func callAsFunction<T>(_ provider: @Sendable @escaping () -> T) -> DIFactory<T> {
        DIFactory(container: self, provider: provider)
    }
}
