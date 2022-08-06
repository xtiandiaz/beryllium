//
//  EdgeInsetsExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 26.7.2022.
//

import Foundation
import SwiftUI

extension EdgeInsets {
    
    public static var zero = EdgeInsets(horizontal: 0, vertical: 0)
    
    public var horizontal: EdgeInsets {
        .init(top: 0, leading: leading, bottom: 0, trailing: trailing)
    }
    
    public var vertical: EdgeInsets {
        .init(top: top, leading: 0, bottom: bottom, trailing: 0)
    }
    
    public init(_ all: CGFloat) {
        self.init(horizontal: all, vertical: all)
    }
    
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    public init(top: CGFloat, horizontal: CGFloat, bottom: CGFloat) {
        self.init(top: top, leading: horizontal, bottom: bottom, trailing: horizontal)
    }
    
    public init(vertical: CGFloat, leading: CGFloat, trailing: CGFloat) {
        self.init(top: vertical, leading: leading, bottom: vertical, trailing: trailing)
    }
    
    public init(top: CGFloat) {
        self.init(top: top, leading: 0, bottom: 0, trailing: 0)
    }
    
    public init(leading: CGFloat) {
        self.init(top: 0, leading: leading, bottom: 0, trailing: 0)
    }
    
    public init(bottom: CGFloat) {
        self.init(top: 0, leading: 0, bottom: bottom, trailing: 0)
    }
    
    public init(trailing: CGFloat) {
        self.init(top: 0, leading: 0, bottom: 0, trailing: trailing)
    }
}
