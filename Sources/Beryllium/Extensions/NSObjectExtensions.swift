//
//  NSObjectExtensions.swift
//  Beryllium
//
//  Created by Cristian Díaz on 6.12.2020.
//

import Foundation

extension NSObject: Configurable {
}

extension NSObject {
    
    public static var className: String {
        NSStringFromClass(Self.self)
    }
    
    public var className: String {
        NSStringFromClass(type(of: self))
    }
}
