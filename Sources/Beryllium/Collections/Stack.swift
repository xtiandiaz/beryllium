//
//  Stack.swift
//  Beryllium
//
//  Created by Cristian Diaz on 12.5.2022.
//

import Foundation

public struct Stack<Element>: Collection, ArrayProtocol {
    
    public typealias Index = BaseCollection.Index
    
    public private(set) var baseCollection = [Element]()
    
    public var startIndex: Index {
        baseCollection.reversed().startIndex
    }
    
    public var endIndex: Index {
        baseCollection.reversed().endIndex
    }
    
    public init() {
    }
    
    public subscript(index: Index) -> Element {
        baseCollection.reversed()[index]
    }
    
    public func peek() -> Element? {
        baseCollection.last
    }
    
    public mutating func push(_ element: Element) {
        baseCollection.append(element)
    }
    
    public mutating func pop() -> Element? {
        if !isEmpty {
            return baseCollection.removeLast()
        }
        
        return nil
    }
    
    public func index(after i: Index) -> Index {
        baseCollection.reversed().index(after: i)
    }
}

extension Stack {
    
    public mutating func insert(_ item: Element, at index: Index) {
        baseCollection.insert(item, at: index)
    }
    
    public mutating func remove(at index: Index) -> Element {
        baseCollection.remove(at: index)
    }
    
    public mutating func removeAll(where shouldBeRemoved: (Element) -> Bool) {
        baseCollection.removeAll(where: shouldBeRemoved)
    }
}
