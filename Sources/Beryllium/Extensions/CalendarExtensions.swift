//
//  CalendarExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.1.2023.
//

import Foundation

extension Calendar {
    
    public func weekdaySymbols() -> [String] {
        let lowerBound = firstWeekday - 1
        let upperBound = lowerBound + 7
        
        return Array(lowerBound..<upperBound).map {
            veryShortWeekdaySymbols[$0 % 7]
        }
    }
}
