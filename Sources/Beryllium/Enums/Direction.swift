//
//  Direction.swift
//  Beryllium
//
//  Created by Cristian Díaz on 19.10.2020.
//

public enum Direction: Int, Equatable {
    
    case up,
         right,
         down,
         left
    
    public var extendedDirection: ExtendedDirection {
        switch self {
        case .up: return .up
        case .right: return .right
        case .down: return .down
        case .left: return .left
        }
    }
}
