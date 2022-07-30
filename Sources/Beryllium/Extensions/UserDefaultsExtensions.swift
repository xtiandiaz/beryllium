//
//  UserDefaultsExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.7.2022.
//

import Foundation

extension UserDefaults {
    
    public func `case`<T: RawRepresentable>(forKey key: String) -> T? where T.RawValue == String {
        if let rawValue = string(forKey: key) {
            return T(rawValue: rawValue)
        }
        return nil
    }
}
