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

extension Date {
    
    public func components(
        _ components: Calendar.Component...,
        inCalendar calendar: Calendar = .current
    ) -> DateComponents {
        calendar.dateComponents(Set(components), from: self)
    }
    
    public func component(
        _ component: Calendar.Component,
        inCalendar calendar: Calendar = .current
    ) -> Int {
        calendar.component(component, from: self)
    }
}
