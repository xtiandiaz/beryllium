//
//  UITouchExtensions.swift
//  Emerald
//
//  Created by Cristian Diaz on 9.5.2022.
//

import Foundation
import SpriteKit

public struct TouchInfo {
    
    public let location: CGPoint
    public let timestamp: TimeInterval
    public let phase: UITouch.Phase
}

public struct SwipeInfo {
    
    public let direction: Direction
    public let magnitude: CGFloat
    
    public init?(direction: Direction?, magnitude: CGFloat) {
        guard let direction = direction else {
            return nil
        }
        
        self.direction = direction
        self.magnitude = magnitude
    }
}

extension TouchInfo {
    
    public func swipeInfoToward(other: TouchInfo) -> SwipeInfo? {
        SwipeInfo(
            direction: location.direction(toward: other.location),
            magnitude: location.distance(to: other.location)
        )
    }
}

extension UITouch {
    
    public func infoFor(node: SKNode) -> TouchInfo {
        TouchInfo(location: location(in: node), timestamp: timestamp, phase: phase)
    }
}
