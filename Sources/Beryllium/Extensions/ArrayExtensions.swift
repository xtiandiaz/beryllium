//
//  ArrayExtensions.swift
//  Beryllium
//
//  Created by Cristian Díaz on 9.8.2021.
//

import Foundation

extension Array {
    
    public mutating func remove(_ item: Element) -> Element? where Element: Equatable {
        if let index = (firstIndex { $0 == item }) {
            return remove(at: index)
        }
        
        return nil
    }
    
    public func isValid(index: Int) -> Bool {
        index >= 0 && index < count
    }
    
    public func sorted<T: Comparable>(by keyPath: KeyPath<Element, T>) -> [Element] {
        sorted {
            $0[keyPath: keyPath] > $1[keyPath: keyPath]
        }
    }
}
