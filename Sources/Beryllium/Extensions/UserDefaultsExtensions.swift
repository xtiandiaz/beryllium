//
//  UserDefaultsExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.7.2022.
//

import Foundation

extension UserDefaults {
    
    public func enumCase<T: RawRepresentable>(forKey key: String) -> T? where T.RawValue == Int {
        T(rawValue: integer(forKey: key))
    }
    
    public func enumCase<T: RawRepresentable>(forKey key: String) -> T? where T.RawValue == String {
        if let rawValue = string(forKey: key) {
            return T(rawValue: rawValue)
        }
        return nil
    }
}
