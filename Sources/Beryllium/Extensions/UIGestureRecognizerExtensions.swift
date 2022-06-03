//
//  UIGestureRecognizerExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 3.6.2022.
//

import Foundation
import SpriteKit

extension UISwipeGestureRecognizer.Direction: Hashable {
    
    public var hashValue: Int {
        Int(rawValue)
    }
    
    public static func fromPoint(_ startPoint: CGPoint, to endPoint: CGPoint) -> Self {
        let offset = CGSize(width: endPoint.x - startPoint.x, height: endPoint.y - startPoint.y)
        
        if abs(offset.width) > abs(offset.height) {
            return offset.width > 0 ? .right : .left
        } else {
            return offset.height > 0 ? .up : .down
        }
    }
}
