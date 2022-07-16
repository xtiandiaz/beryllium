//
//  ViewExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 7.7.2022.
//

import Foundation
import SwiftUI

extension View {
    
    public func zIndex(_ value: Int) -> some View {
        zIndex(Double(value))
    }
    
    public func anchorPreference(id: UUID, value: Anchor<CGRect>.Source) -> some View {
        self.anchorPreference(key: AnchorPreferenceKey.self, value: value) {
            [AnchorPreferenceValue(id: id, anchor: $0)]
        }
    }
    
    @ViewBuilder
    public func `if`<Content: View>(_ condition: Bool, apply: (Self) -> Content) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
}
