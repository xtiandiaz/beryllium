//
//  OptionalExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 21.4.2022.
//

import Foundation

extension Optional {
    
    public var isNil: Bool {
        self == nil
    }
}

extension Optional where Wrapped == String {
    
    public var isNilOrEmpty: Bool {
        isNil || self!.isEmpty
    }
}
