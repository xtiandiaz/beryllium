//
//  Spacing.swift
//  Beryllium
//
//  Created by Cristian Diaz on 27.7.2022.
//

import Foundation
import CoreGraphics

public struct Spacing {
    
    public static let zero = Spacing(horizontal: 0, vertical: 0)
    
    public let horizontal: CGFloat
    public let vertical: CGFloat
    
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.horizontal = horizontal
        self.vertical = vertical
    }
    
    public init(_ value: CGFloat) {
        self.init(horizontal: value, vertical: value)
    }
}
