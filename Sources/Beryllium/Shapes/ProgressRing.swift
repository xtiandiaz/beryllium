//
//  ProgessRing.swift
//  Beryllium
//
//  Created by Cristian Diaz on 7.8.2022.
//

import Foundation
import SwiftUI

public struct ProgressRing: InsettableShape {    
    
    public var animatableData: Double {
        get { progress }
        set { progress = min(newValue, 1) }
    }
    
    public init(progress: Double) {
        self.progress = min(progress, 1)
    }
    
    public func path(in rect: CGRect) -> Path {
        Path {
            $0.addArc(
                center: rect.center,
                radius: rect.width / 2 - inset,
                startAngle: Angle.degrees(-90),
                endAngle: Angle.degrees(-90 + Double(360) * progress),
                clockwise: false
            )
        }
    }
    
    public func inset(by amount: CGFloat) -> Self {
        var ring = self
        ring.inset += amount
        return ring
    }
    
    // MARK: - Private
    
    private var inset: CGFloat = 0
    private var progress: Double
}
