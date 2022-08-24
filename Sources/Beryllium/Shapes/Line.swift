//
//  Line.swift
//  Beryllium
//
//  Created by Cristian Diaz on 23.8.2022.
//

import Foundation
import SwiftUI

public struct Line: Shape {
    
    public init() {
    }
    
    public func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: 0, y: rect.midY))
        path.addLine(to: CGPoint(x: rect.width, y: rect.midY))
        return path
    }
}
