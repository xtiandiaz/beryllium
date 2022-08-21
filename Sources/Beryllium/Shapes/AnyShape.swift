//
//  AnyShape.swift
//  Beryllium
//
//  Created by Cristian Diaz on 21.8.2022.
//

import Foundation
import SwiftUI

public struct AnyShape: Shape {
    
    public init<S: Shape>(_ shape: S) {
        _path = { shape.path(in: $0) }
    }

    public func path(in rect: CGRect) -> Path {
        _path(rect)
    }
    
    // MARK: - Private

    private let _path: (CGRect) -> Path
}
