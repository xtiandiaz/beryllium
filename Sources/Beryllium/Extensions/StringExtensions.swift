//
//  StringExtensions.swift
//  BerilioUI
//
//  Created by Cristian Diaz on 22.8.2022.
//

import Foundation
import SwiftUI

extension String {
    
    public static let nonbreakingSpace = "\u{00a0}"
    public static let nonbreakingHyphen = "\u{2011}"
}

extension Optional where Wrapped: StringProtocol {
    
    var isNilOrEmpty: Bool {
        self?.isEmpty ?? true
    }
}
