//
//  UIFontExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 9.12.2022.
//

import Foundation
import SwiftUI
import UIKit

extension UIFont {
    
    public static func font(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
        let metrics = UIFontMetrics(forTextStyle: textStyle)
        return metrics.scaledFont(for: UIFont.systemFont(ofSize: textStyle.size, weight: textStyle.weight))
    }
}

extension UIFont.TextStyle {
    
    public var size: CGFloat {
        suiTextStyle.size
    }
    
    public var weight: UIFont.Weight {
        suiTextStyle.weight.uiWeight
    }
    
    public var design: UIFontDescriptor.SystemDesign {
        suiTextStyle.design.uiDesign
    }
    
    public var symbolWeight: UIImage.SymbolWeight {
        switch self {
        case .largeTitle, .title1, .title2, .title3, .headline, .subheadline:
            return .semibold
        case .caption1, .caption2:
            return .medium
        default:
            return .regular
        }
    }
    
    public var suiTextStyle: Font.TextStyle {
        switch self {
        case .largeTitle: return .largeTitle
        case .title1: return .title
        case .title2: return .title2
        case .title3: return .title3
        case .headline: return .headline
        case .body: return .body
        case .callout: return .callout
        case .subheadline: return .subheadline
        case .footnote: return .footnote
        case .caption1: return .caption
        case .caption2: return .caption2
        default: return .body
        }
    }
}
