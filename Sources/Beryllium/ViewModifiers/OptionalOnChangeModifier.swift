//
//  OptionalOnChangeModifier.swift
//  BerilioUI
//
//  Created by Cristian Diaz on 22.8.2022.
//

import Foundation
import SwiftUI

public struct OptionalOnChangeModifier<Value: Equatable>: ViewModifier {
    
    @StateObject private var valueObject = ValueObject()
    
    public init(value: Value?, onChange: @escaping (Value?) -> Void) {
        self.value = value
        self.onChange = onChange
    }
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                if value != valueObject.value {
                    onChange(value)
                }
                
                valueObject.value = value
            }
    }
    
    // MARK: - Private
    
    private class ValueObject: ObservableObject {
        
        var value: Value?
    }
    
    private let value: Value?
    private let onChange: (Value?) -> Void
}

extension View {
    
    public func onChange<Value: Equatable>(
        of value: Value?,
        _ perform: @escaping (Value?) -> Void
    ) -> some View {
        self.modifier(OptionalOnChangeModifier(value: value, onChange: perform))
    }
}
