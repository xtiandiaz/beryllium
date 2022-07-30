//
//  UserDefault.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.7.2022.
//

import Foundation

@propertyWrapper
public struct UserDefault<T> {
    
    public var wrappedValue: T {
        get {
            UserDefaults.standard.value(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    public init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    // MARK: - Private
    
    private let key: String
    private let defaultValue: T
}

@propertyWrapper
public struct EnumUserDefault<T: RawRepresentable> {
    
    public var wrappedValue: T? {
        get {
            if let rawValue = UserDefaults.standard.value(forKey: key) as? T.RawValue {
                return T(rawValue: rawValue) ?? defaultValue
            }
            return defaultValue
        }
        set {
            UserDefaults.standard.set(newValue?.rawValue, forKey: key)
        }
    }
    
    public init(_ key: String, defaultValue: T?) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    // MARK: - Private
    
    private let key: String
    private let defaultValue: T?
}
