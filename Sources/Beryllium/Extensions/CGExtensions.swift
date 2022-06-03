//
//  CGExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 3.6.2022.
//

import CoreGraphics

public extension CGPoint {
    
    func distanceSquared(to: CGPoint) -> CGFloat {
        (to.x - x) * (to.x - x) + (to.y - y) * (to.y - y)
    }
    
    func distance(to: CGPoint) -> CGFloat {
        sqrt(distanceSquared(to: to))
    }
}
