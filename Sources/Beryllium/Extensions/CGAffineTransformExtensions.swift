//
//  CGAffineTransformExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 14.12.2022.
//

import Foundation

extension CGAffineTransform {
    
    public init(scale: CGFloat) {
        self.init(scaleX: scale, y: scale)
    }
}
