//
//  EdgeExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 18.8.2022.
//

import Foundation
import SwiftUI

extension Edge.Set {
    
    public func insets(length: CGFloat) -> EdgeInsets {
        sieve(insets: .init(length))
    }
    
    public func sieve(insets: EdgeInsets) -> EdgeInsets {
        .init(
            top: contains(.top) ? insets.top : 0,
            leading: contains(.leading) ? insets.leading : 0,
            bottom: contains(.bottom) ? insets.bottom : 0,
            trailing: contains(.trailing) ? insets.trailing : 0
        )
    }
}
