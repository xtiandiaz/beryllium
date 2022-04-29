//
//  Configurable.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.4.2022.
//

import Foundation

public protocol Configurable {
    
    associatedtype T = Self
    
    func configure(_ closure: (T) -> Void) -> T
}

public extension Configurable {
    
    @discardableResult
    func configure(_ closure: (Self) -> Void) -> Self {
        closure(self)
        return self
    }
}
