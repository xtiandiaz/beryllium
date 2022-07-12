//
//  AnchorPreference.swift
//  Beryllium
//
//  Created by Cristian Diaz on 11.7.2022.
//

import Foundation
import SwiftUI

public struct AnchorPreferenceValue: Identifiable, Equatable {
    
    public let id: UUID
    public let anchor: Anchor<CGRect>
}

public struct AnchorPreferenceKey: PreferenceKey {
    
    public static var defaultValue: [AnchorPreferenceValue] = []
    
    public static func reduce(
        value: inout [AnchorPreferenceValue],
        nextValue: () -> [AnchorPreferenceValue]
    ) {
        value.append(contentsOf: nextValue())
    }
}
