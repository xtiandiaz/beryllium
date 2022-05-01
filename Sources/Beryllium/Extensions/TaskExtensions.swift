//
//  TaskExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 29.4.2022.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    
    public static func sleep(seconds: TimeInterval) async throws {
        try await sleep(nanoseconds: seconds.toNanoseconds())
    }
}
