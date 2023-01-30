//
//  ComparableExtensions.swift
//  BerilioUI
//
//  Created by Cristian Diaz on 13.12.2022.
//

import Foundation

extension Comparable {
    
    public func clamped(to limits: ClosedRange<Self>) -> Self {
        min(max(self, limits.lowerBound), limits.upperBound)
    }
    
    public func isOutside(limits: ClosedRange<Self>) -> Bool {
        self < limits.lowerBound || self > limits.upperBound
    }
}
