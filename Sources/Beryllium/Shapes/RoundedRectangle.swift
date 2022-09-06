//
//  RoundedRectangle.swift
//  Beryllium
//
//  Created by Cristian Diaz on 5.9.2022.
//

import Foundation
import SwiftUI

public struct RoundedRectangle: Shape {
    
    public init(corners: UIRectCorner, radius: CGFloat) {
        self.corners = corners
        self.radius = radius
    }
    
    public func path(in rect: CGRect) -> Path {
        let bezierPath = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(length: radius)
        )
        
        return Path(bezierPath.cgPath)
    }
    
    // MARK: - Private
    
    private let corners: UIRectCorner
    private let radius: CGFloat
}
