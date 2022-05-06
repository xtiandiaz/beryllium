//
//  CombineExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 3.5.2022.
//

import Combine
import Foundation

extension Future where Failure == Never {
    
    public convenience init(operation: @escaping () async -> Output) {
        self.init { promise in
            Task {
                promise(.success(await operation()))
            }
        }
    }
}

extension Future where Failure == Error {
    
    public convenience init(operation: @escaping () async throws -> Output) {
        self.init { promise in
            Task {
                do {
                    let output = try await operation()
                    promise(.success(output))
                } catch {
                    promise(.failure(error))
                }
            }
        }
    }
}
