//
//  NSDirectionalEdgeInsetsExtensions.swift
//  BerilioUI
//
//  Created by Cristian Diaz on 12.12.2022.
//

import Foundation
import UIKit

extension NSDirectionalEdgeInsets {
    
    public init(_ inset: CGFloat) {
        self.init(top: inset, leading: inset, bottom: inset, trailing: inset)
    }
    
    public init(horizontal: CGFloat, vertical: CGFloat) {
        self.init(top: vertical, leading: horizontal, bottom: vertical, trailing: horizontal)
    }
}
