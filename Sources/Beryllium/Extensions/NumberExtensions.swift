//
//  NumberExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 7.7.2022.
//

import Foundation
import CoreGraphics

extension Int {
    
    public func stepAround(_ a: Int, _ b: Int, by: Int = 1) -> Int {
        var next = self + by
        if next < a || next >= b {
            next = a
        }
        return next
    }
    
    public static func / (lhs: Int, rhs: CGFloat) -> CGFloat {
        CGFloat(lhs) / rhs
    }
}

extension Double {
    
    public func lerp(to: Double, at t: Double) -> Double {
        self + (to - self) * t
    }
    
    public static func * (lhs: Int, rhs: Double) -> Double {
        Double(lhs) * rhs
    }
    
    public static func * (lhs: Double, rhs: Int) -> Double {
        lhs * Double(rhs)
    }
    
    public static func / (lhs: Int, rhs: Double) -> Double {
        Double(lhs) / rhs
    }
    
    public static func / (lhs: Double, rhs: Int) -> Double {
        lhs / Double(rhs)
    }
}

extension Float {
    
    public static func * (lhs: Int, rhs: Float) -> Float {
        Float(lhs) * rhs
    }
    
    public static func * (lhs: Float, rhs: Int) -> Float {
        lhs * Float(rhs)
    }
    
    public static func / (lhs: Int, rhs: Float) -> Float {
        Float(lhs) / rhs
    }
}

