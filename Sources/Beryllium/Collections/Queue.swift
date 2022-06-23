//
//  Queue.swift
//  Beryllium
//
//  Created by Cristian Diaz on 6.6.2022.
//

import Foundation

public struct Queue<Element>: Collection {
    
    public typealias Index = Array<Element>.Index
    
    public var startIndex: Index {
        items.startIndex
    }
    
    public var endIndex: Index {
        items.endIndex
    }
    
    public init() {
    }
    
    public subscript(index: Index) -> Element {
        items[index]
    }
    
    public func peek() -> Element? {
        items.first
    }
    
    public mutating func add(_ element: Element) {
        items.append(element)
    }
    
    public mutating func poll() -> Element? {
        if !isEmpty {
            return items.removeFirst()
        }
        
        return nil
    }
    
    public func index(after i: Index) -> Index {
        items.index(after: i)
    }
    
    // MARK: - Private
    
    private var items = [Element]()
}

extension Queue {
    
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
