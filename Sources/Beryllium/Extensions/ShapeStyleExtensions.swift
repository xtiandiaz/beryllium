//
//  ShapeStyleExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 17.8.2022.
//

import Foundation
import SwiftUI

extension AnyShapeStyle {
    
    public static var foregroundStyle: Self {
        .init(ForegroundStyle())
    }
    
    public static var backgroundStyle: Self {
        .init(BackgroundStyle())
    }
    
    public init?<S: ShapeStyle>(_ style: S?) {
        guard let style = style else {
            return nil
        }
        
        self.init(style)
    }
}
