//
//  NSObjectExtensions.swift
//  Beryllium
//
//  Created by Cristian Díaz on 6.12.2020.
//

import Foundation

extension NSObjectProtocol {
    
    @discardableResult
    public func configure(_ block: ((Self) -> Void)) -> Self {
        block(self)
        return self
    }
}
