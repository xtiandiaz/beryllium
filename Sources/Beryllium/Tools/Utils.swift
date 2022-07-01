//
//  Utils.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.4.2022.
//

import Foundation

public func with<T>(_ object: T?, _ closure: (T) -> Void) {
    if let object = object {
        closure(object)
    }
}

public func with<T, R>(_ object: T?, _ withClosure: (T) -> R, without withoutClosure: () -> R) -> R {
    if let object = object {
        return withClosure(object)
    }
    
    return withoutClosure()
}
