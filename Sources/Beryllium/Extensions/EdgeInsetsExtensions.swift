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
    
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
    
    public init(top: CGFloat, horizontal: CGFloat, bottom: CGFloat) {
        self.init(top: top, leading: horizontal, bottom: bottom, trailing: horizontal)
    }
}
