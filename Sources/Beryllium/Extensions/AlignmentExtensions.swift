//
//  AlignmentExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 31.1.2023.
//

import Foundation
import SwiftUI

extension VerticalAlignment {
    
    public var opposite: VerticalAlignment {
        switch self {
        case .top: return .bottom
        case .bottom: return .top
        case .firstTextBaseline: return .lastTextBaseline
        case .lastTextBaseline: return .firstTextBaseline
        default: return .center
        }
    }
}

extension HorizontalAlignment {
    
    public var opposite: HorizontalAlignment {
        switch self {
        case .leading: return .trailing
        case .trailing: return .leading
//        case .listRowSeparatorLeading: return .listRowSeparatorTrailing
//        case .listRowSeparatorTrailing: return .listRowSeparatorLeading
        default: return .center
        }
    }
}
