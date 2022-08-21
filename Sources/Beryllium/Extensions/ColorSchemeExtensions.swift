//
//  ColorSchemeExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 25.7.2022.
//

import Foundation
import SwiftUI

extension ColorScheme {
    
    public var name: String {
        switch self {
        case .light: return "Light"
        case .dark: return "Dark"
        @unknown default: return "Unknown"
        }
    }
    
    public var uiUserInterfaceStyle: UIUserInterfaceStyle {
        switch self {
        case .light: return .light
        case .dark: return .dark
        @unknown default: return .light
        }
    }
}
