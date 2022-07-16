//
//  DateTimeExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.4.2022.
//

import Foundation

extension TimeInterval {
    
    public func toNanoseconds() -> UInt64 {
        UInt64(self * 1_000_000_000)
    }
}
