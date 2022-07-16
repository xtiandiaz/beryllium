//
//  CGExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 3.6.2022.
//

import CoreGraphics
import simd.vector_types

public func abs(_ point: CGPoint) -> CGPoint {
    CGPoint(x: abs(point.x), y: abs(point.y))
}

public func abs(_ size: CGSize) -> CGSize {
    CGSize(width: abs(size.width), height: abs(size.height))
}

extension CGPoint {
    
    public static var one: CGPoint {
        CGPoint(xy: 1)
    }
    
    public static var up: CGPoint {
        CGPoint(x: 0, y: 1)
    }
    
    public static var right: CGPoint {
        CGPoint(x: 1, y: 0)
    }
    
    public static var down: CGPoint {
        CGPoint(x: 0, y: -1)
    }
    
    public static var left: CGPoint {
        CGPoint(x: -1, y: 0)
    }
    
    public init(xy: CGFloat) {
        self.init(x: xy, y: xy)
    }
    
    public init(x: CGFloat) {
        self.init(x: x, y: 0)
    }
    
    public init(x: Int) {
        self.init(x: x, y: 0)
    }
    
    public init(y: CGFloat) {
        self.init(x: 0, y: y)
    }
    
    public init(y: Int) {
        self.init(x: 0, y: y)
    }
    
    public func offset(to: CGPoint) -> CGSize {
        CGSize(width: to.x - x, height: to.y - y)
    }
    
    public func offset(by offset: CGSize) -> CGPoint {
        CGPoint(x: x + offset.width, y: y + offset.height)
    }
    
    public func points(count: Int, offset: CGSize) -> [CGPoint] {
        (0..<count).map { [offsetPoint = offset.asPoint()] in
            CGPoint(x: x + offsetPoint.x * $0, y: y + offsetPoint.y * $0)
        }
    }
    
    public static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
    
    public static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }
    
    public static func * (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x * rhs.x, y: lhs.y * rhs.y)
    }
    
    public static func * (lhs: CGPoint, rhs: CGFloat) -> CGPoint {
        CGPoint(x: lhs.x * rhs, y: lhs.y * rhs)
    }
    
    public static func * (lhs: CGPoint, rhs: Int) -> CGPoint {
        lhs * CGFloat(rhs)
    }
    
    public func asOffset() -> CGSize {
        CGSize(width: x, height: y)
    }
    
    public func vector_float2() -> vector_float2 {
        simd.vector_float2(Float(x), Float(y))
    }
    
    public func distanceSquared(to: CGPoint) -> CGFloat {
        (to.x - x) * (to.x - x) + (to.y - y) * (to.y - y)
    }
    
    public func distance(to: CGPoint) -> CGFloat {
        sqrt(distanceSquared(to: to))
    }
    
    public func direction(toward target: CGPoint) -> Direction? {
        let vector  = CGPoint(x: target.x - x, y: target.y - y)
        
        guard vector != .zero else {
            return nil
        }
        
        let absVector = abs(vector)
        
        return absVector.x > absVector.y
            ? vector.x > 0 ? .right : .left
            : vector.y > 0 ? .up : .down
    }
}

extension CGSize {
    
    public static var one: CGSize {
        CGSize(length: 1)
    }
    
    public var center: CGPoint {
        CGPoint(x: width * 0.5, y: height * 0.5)
    }
    
    public var aspectRatio: CGFloat {
        width / height
    }
    
    public var inverseAspectRatio: CGFloat {
        height / width
    }
    
    public var magnitude: CGFloat {
        asPoint().distance(to: .zero)
    }
    
    public var magnitudeSquared: CGFloat {
        asPoint().distanceSquared(to: .zero)
    }
    
    public init(length: CGFloat) {
        self.init(width: length, height: length)
    }
    
    public init(width: CGFloat) {
        self.init(width: width, height: 0)
    }
    
    public init(height: CGFloat) {
        self.init(width: 0, height: height)
    }
    
    public static func + (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width + rhs.width, height: lhs.height + rhs.height)
    }
    
    public static func - (lhs: CGSize, rhs: CGSize) -> CGSize {
        CGSize(width: lhs.width - rhs.width, height: lhs.height - rhs.height)
    }
    
    public static func * (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width * rhs, height: lhs.height * rhs)
    }
    
    public static func * (lhs: CGSize, rhs: Int) -> CGSize {
        lhs * CGFloat(rhs)
    }
    
    public static func / (lhs: CGSize, rhs: CGFloat) -> CGSize {
        CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
    
    public func asPoint() -> CGPoint {
        CGPoint(x: width, y: height)
    }
}

extension CGRect {
    
    public var center: CGPoint {
        CGPoint(x: minX + width * 0.5, y: minY + height * 0.5)
    }
    
    public init(size: CGSize) {
        self.init(origin: .zero, size: size)
    }
}
