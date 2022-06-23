//
//  Stack.swift
//  Beryllium
//
//  Created by Cristian Diaz on 12.5.2022.
//

import Foundation

public struct Stack<Element>: Collection {
    
    public typealias Index = Array<Element>.Index
    
    public var startIndex: Index {
        items.reversed().startIndex
    }
    
    public var endIndex: Index {
        items.reversed().endIndex
    }
    
    public init() {
    }
    
    public subscript(index: Index) -> Element {
        items.reversed()[index]
    }
    
    public func peek() -> Element? {
        items.last
    }
    
    public mutating func push(_ element: Element) {
        items.append(element)
    }
    
    public mutating func pop() -> Element? {
        if !isEmpty {
            return items.removeLast()
        }
        
        return nil
    }
    
    public func index(after i: Index) -> Index {
        items.reversed().index(after: i)
    }
    
    // MARK: - Private
    
    private var items = [Element]()
}

extension Stack {
    
    public mutating func insert(_ item: Element, at index: Index) {
        items.insert(item, at: index)
    }
    
    public mutating func remove(at index: Index) -> Element {
        items.remove(at: index)
    }
    
    public mutating func removeAll(where shouldBeRemoved: (Element) -> Bool) {
        items.removeAll(where: shouldBeRemoved)
    }
}
