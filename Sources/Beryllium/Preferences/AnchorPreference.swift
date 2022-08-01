//
//  AnchorPreference.swift
//  Beryllium
//
//  Created by Cristian Diaz on 11.7.2022.
//

import Foundation
import SwiftUI

public struct AnchorPreferenceValue<ID: Hashable>: Identifiable, Equatable {
    
    public let id: ID
    public let anchor: Anchor<CGRect>
}

public struct AnchorPreferenceKey<ID: Hashable>: PreferenceKey {
    
    public static var defaultValue: [AnchorPreferenceValue<ID>] {
        []
    }
    
    public static func reduce(
        value: inout [AnchorPreferenceValue<ID>],
        nextValue: () -> [AnchorPreferenceValue<ID>]
    ) {
        value.append(contentsOf: nextValue())
    }
}
