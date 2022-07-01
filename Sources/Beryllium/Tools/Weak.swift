//
//  Weak.swift
//  Beryllium
//
//  Created by Cristian Diaz on 25.5.2022.
//

import Foundation

public protocol WeakWrappable {
    
    associatedtype Value: AnyObject
    
    var weakValue: Value? { get }
}

public class Weak<T: AnyObject> {
    
    public private(set) weak var weakValue: T?
    
    public init(_ value: T) {
        weakValue = value
    }
}

extension Weak: WeakWrappable {
}

public extension Array where Element: WeakWrappable, Element.Value: Equatable {
    
    var values: [Element.Value] {
        compactMap { $0.weakValue }
    }
    
    func contains(_ value: Element.Value) -> Bool {
        values.contains(value)
    }
}
