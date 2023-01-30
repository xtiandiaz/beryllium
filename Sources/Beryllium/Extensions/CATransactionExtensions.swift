//
//  CATransactionExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 9.12.2022.
//

import Foundation
import QuartzCore

extension CATransaction {
    
    public static func performWithoutActions(_ block: () -> Void) {
        CATransaction.begin()
        CATransaction.setDisableActions(true)
        block()
        CATransaction.commit()
    }
}
