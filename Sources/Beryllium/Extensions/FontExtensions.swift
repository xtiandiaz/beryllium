//
//  FontExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 9.12.2022.
//

import Foundation
import SwiftUI

extension Font.TextStyle {
    
    public var size: CGFloat {
        switch self {
        case .largeTitle: return 34
        case .title: return 28
        case .title2: return 22
        case .title3: return 20
        case .headline, .body: return 17
        case .callout: return 16
        case .subheadline: return 15
        case .footnote: return 13
        case .caption: return 12
        case .caption2: return 11
        @unknown default: return 17
        }
    }
    
    public var weight: Font.Weight {
        switch self {
        case .largeTitle, .title, .title2, .title3, .headline, .subheadline, .caption2:
            return .bold
        default:
            return .regular
        }
    }
    
    public var design: Font.Design {
        switch self {
        case .largeTitle, .title, .title2, .title3, .headline, .subheadline, .caption2:
            return .rounded
        default:
            return .default
        }
    }
}

extension Font.Weight {
    
    public var uiWeight: UIFont.Weight {
        switch self {
        case .ultraLight: return .ultraLight
        case .thin: return .thin
        case .light: return .light
        case .regular: return .regular
        case .medium: return .medium
        case .semibold: return .semibold
        case .bold: return .bold
        case .heavy: return .heavy
        case .black: return .black
        default: return .regular
        }
    }
}

extension Font.Design {
    
    public var uiDesign: UIFontDescriptor.SystemDesign {
        switch self {
        case .rounded: return .rounded
        case .monospaced: return .monospaced
        case .serif: return .serif
        case .default: return .default
        @unknown default: return .default
        }
    }
}
