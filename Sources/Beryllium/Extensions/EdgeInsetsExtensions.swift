//
//  EdgeInsetsExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 26.7.2022.
//

import Foundation
import SwiftUI

extension EdgeInsets {
    
    public var horizontal: EdgeInsets {
        .init(top: 0, leading: leading, bottom: 0, trailing: trailing)
    }
    
    public var vertical: EdgeInsets {
        .init(top: top, leading: 0, bottom: bottom, trailing: 0)
    }
    
    public init(horizontal: CGFloat = 0, vertical: CGFloat = 0) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
}
