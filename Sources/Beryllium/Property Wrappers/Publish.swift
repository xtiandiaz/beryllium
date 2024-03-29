//
//  Publish.swift
//  Beryllium
//
//  Created by Cristian Diaz on 14.4.2022.
//

import Combine
import Foundation

@propertyWrapper
public class Publish<T> {
    
    public var wrappedValue: T {
        get { valueSubject.value }
        set { valueSubject.value = newValue }
    }
    
    public var projectedValue: AnyPublisher<T, Never> {
        valueSubject.receive(on: DispatchQueue.main).eraseToAnyPublisher()
    }
    
    public init(wrappedValue: T) {
        valueSubject = CurrentValueSubject<T, Never>(wrappedValue)
    }
    
    // MARK: - Private
    
    private let valueSubject: CurrentValueSubject<T, Never>
}
