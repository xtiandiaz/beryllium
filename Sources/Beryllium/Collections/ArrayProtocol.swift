//
//  ArrayProtocol.swift
//  Beryllium
//
//  Created by Cristian Diaz on 7.7.2022.
//

import Foundation

public protocol ArrayProtocol: RandomAccessCollection where Index == BaseCollection.Index {
    
    associatedtype BaseCollection: RandomAccessCollection
    
    var baseCollection: BaseCollection { get }
    
    subscript(index: Index) -> Element { get }
}

extension ArrayProtocol {
    
    public var startIndex: Index {
        baseCollection.startIndex
    }
    
    public var endIndex: Index {
        baseCollection.endIndex
    }
    
    public subscript(index: Index) -> BaseCollection.Element {
        baseCollection[index]
    }
    
    public func formIndex(after i: inout Index) {
        baseCollection.formIndex(after: &i)
    }
    
    public func formIndex(before i: inout Index) {
        baseCollection.formIndex(before: &i)
    }
    
    public func index(after i: Index) -> Index {
        baseCollection.index(after: i)
    }
}
