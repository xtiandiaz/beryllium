//
//  ViewExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 7.7.2022.
//

import Foundation
import SwiftUI

// MARK: - Layout

extension View {
    
    public func zIndex(_ value: Int) -> some View {
        zIndex(Double(value))
    }
    
    public func padding(_ edges: Edge.Set, _ insets: EdgeInsets) -> some View {
        self.padding(edges.sieve(insets: insets))
    }
}

// MARK: - Style

extension View {
    
    public func linearGradient(_ gradient: LinearGradient) -> some View {
        self.hidden()
            .overlay(gradient.mask(self))
    }
}

// MARK: - Preferences

extension View {
    
    public func anchorPreference<ID: Hashable>(id: ID, value: Anchor<CGRect>.Source) -> some View {
        self.anchorPreference(key: AnchorPreferenceKey<ID>.self, value: value) {
            [AnchorPreferenceValue(id: id, anchor: $0)]
        }
    }
}

// MARK: - ViewBuilder

extension View {
    
    @ViewBuilder public func `if`<Result: View>(
        _ condition: Bool,
        apply: (Self) -> Result
    ) -> some View {
        if condition {
            apply(self)
        } else {
            self
        }
    }
    
    @ViewBuilder public func `if`<ResultIf: View, ResultElse: View>(
        _ condition: Bool,
        apply: (Self) -> ResultIf,
        else elseApply: (Self) -> ResultElse
    ) -> some View {
        if condition {
            apply(self)
        } else {
            elseApply(self)
        }
    }
    
    @ViewBuilder public func with<T, Result: View>(
        _ value: T?,
        apply: (Self, T) -> Result
    ) -> some View {
        if let value = value {
            apply(self, value)
        } else {
            self
        }
    }
    
    @ViewBuilder public func with<T, ResultWith: View, ResultWithout: View>(
        _ value: T?,
        apply: (Self, T) -> ResultWith,
        without withoutApply: (Self) -> ResultWithout
    ) -> some View {
        if let value = value {
            apply(self, value)
        } else {
            withoutApply(self)
        }
    }
    
    @ViewBuilder public func hidden(_ condition: Bool) -> some View {
        if condition {
            self.hidden()
        } else {
            self
        }
    }
}
