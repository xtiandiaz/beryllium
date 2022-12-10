//
//  UIImageExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 9.12.2022.
//

import Foundation
import UIKit

extension UIImage {
    
    public static func symbol(
        _ systemName: String,
        withTextStyle textStyle: UIFont.TextStyle,
        scale: SymbolScale = .medium
    ) -> UIImage {
        UIImage(systemName: systemName)!
            .withRenderingMode(.alwaysTemplate)
            .withConfiguration(
                UIImage.SymbolConfiguration(
                    pointSize: UIFont.preferredFont(forTextStyle: textStyle).pointSize,
                    weight: textStyle.symbolWeight
                )
            )
    }
    
    public static func circle(withSize size: CGFloat, color: UIColor) -> UIImage? {
        let size = CGSize(width: size, height: size)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        context.setFillColor(color.cgColor)
        context.setStrokeColor(UIColor.clear.cgColor)
        
        context.addEllipse(in: CGRect(origin: .zero, size: size))
        context.drawPath(using: .fill)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image
    }
    
    public func resized(to size: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: size)
        let result = renderer.image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }

        return result.withRenderingMode(renderingMode)
    }
}
