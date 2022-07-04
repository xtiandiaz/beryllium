//
//  CGExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 3.6.2022.
//

import CoreGraphics

public func abs(_ point: CGPoint) -> CGPoint {
    CGPoint(x: abs(point.x), y: abs(point.y))
}

extension CGPoint {
    
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
