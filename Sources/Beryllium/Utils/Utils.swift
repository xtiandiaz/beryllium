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
