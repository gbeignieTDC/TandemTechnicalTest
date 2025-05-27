//
//  TypedFactory.swift
//  TandemCore
//
//  Created by Tandem on 31/03/2025.
//

/// A generic factory that produces instances of type `T`.
/// It stores a closure that provides instances when needed.
internal struct DITypedFactory<T>: DIAnyFactory {
    let factory: () -> T
}
