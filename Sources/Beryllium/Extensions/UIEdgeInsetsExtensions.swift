//
//  UIEdgeInsetsExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 5.12.2022.
//

import Foundation
import UIKit

extension UIEdgeInsets {
    
    public var horizontal: UIEdgeInsets {
        .init(top: 0, left: left, bottom: 0, right: right)
    }
    
    public var vertical: UIEdgeInsets {
        .init(top: top, left: 0, bottom: bottom, right: 0)
    }
    
    public var sum: CGFloat {
        top + left + bottom + right
    }
    
    public init(_ all: CGFloat) {
        self.init(horizontal: all, vertical: all)
    }
    
    public init(top: CGFloat, bottom: CGFloat, horizontal: CGFloat = 0) {
        self.init(top: top, left: horizontal, bottom: bottom, right: horizontal)
    }
    
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, left: horizontal, bottom: vertical, right: horizontal)
    }
    
    public init(left: CGFloat, right: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: right)
    }
    
    public init(top: CGFloat) {
        self.init(top: top, left: 0, bottom: 0, right: 0)
    }
    
    public init(left: CGFloat) {
        self.init(top: 0, left: left, bottom: 0, right: 0)
    }
    
    public init(bottom: CGFloat) {
        self.init(top: 0, left: 0, bottom: bottom, right: 0)
    }
    
    public init(right: CGFloat) {
        self.init(top: 0, left: 0, bottom: 0, right: right)
    }
    
    public static func +(lhs: UIEdgeInsets, rhs: UIEdgeInsets) -> UIEdgeInsets {
        .init(
            top: lhs.top + rhs.top,
            left: lhs.left + rhs.left,
            bottom: lhs.bottom + rhs.bottom,
            right: lhs.right + rhs.right
        )
    }
    
    public static func +=(lhs: inout UIEdgeInsets, rhs: UIEdgeInsets) {
        lhs = lhs + rhs
    }
    
    public func withBottom(_ bottom: CGFloat) -> Self {
        .init(top: top, left: left, bottom: bottom, right: right)
    }
    
    public func withHorizontal(_ horizontal: CGFloat) -> Self {
        .init(top: top, left: horizontal, bottom: bottom, right: horizontal)
    }
    
    public func withHorizontal(_ horizontal: UIEdgeInsets) -> Self {
        .init(top: top, left: horizontal.left, bottom: bottom, right: horizontal.right)
    }
    
    public func withVertical(_ vertical: CGFloat) -> Self {
        .init(top: vertical, left: left, bottom: vertical, right: right)
    }
    
    public func withVertical(_ vertical: UIEdgeInsets) -> Self {
        .init(top: vertical.top, left: left, bottom: vertical.bottom, right: right)
    }
}
