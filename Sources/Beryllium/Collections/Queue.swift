//
//  Queue.swift
//  Beryllium
//
//  Created by Cristian Diaz on 6.6.2022.
//

import Foundation

public struct Queue<Element>: Collection, ArrayProtocol {
    
    public typealias Index = BaseCollection.Index
    
    public private(set) var baseCollection = [Element]()
    
    public init() {
    }
    
    public func peek() -> Element? {
        baseCollection.first
    }
    
    public mutating func add(_ element: Element) {
        baseCollection.append(element)
    }
    
    public mutating func poll() -> Element? {
        if !isEmpty {
            return baseCollection.removeFirst()
        }
        
        return nil
    }
}

extension Queue {
    
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
