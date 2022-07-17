//
//  DragAndDropMonitor.swift
//  Beryllium
//
//  Created by Cristian Diaz on 15.7.2022.
//

import Foundation
import SwiftUI

public final class DragAndDropMonitor: ObservableObject, Configurable {
    
    @Published public private(set) var dragOffset: Offset = .zero
    
    public var onPicked: (() -> Void)?
    public var onDropped: ((Offset) -> Void)?
    public var onSwiped: ((Direction, Offset) -> Void)?
    
    public init(minAbsSpeedForSwipe: CGFloat = 20) {
        self.minAbsSpeedForSwipe = minAbsSpeedForSwipe
    }
    
    public func gesture() -> some Gesture {
        DragGesture(minimumDistance: 0).onChanged { [unowned self] in
            update(with: $0)
        }.onEnded { [unowned self] in
            end(with: $0)
        }
    }
    
    // MARK: - Private
    
    private let minAbsSpeedForSwipe: CGFloat
    
    private var startTime: Date?
    
    private func update(with value: DragGesture.Value) {
        if startTime.isNil {
            startTime = value.time
            
            onPicked?()
        }
        
        dragOffset = value.translation
    }
    
    private func end(with value: DragGesture.Value) {
        defer {
            startTime = nil
            dragOffset = .zero
        }
        
        guard let onSwipe = onSwiped else {
            onDropped?(dragOffset)
            return
        }
        
        let velocity = value.predictedEndTranslation - value.translation
        let absVelocity = abs(velocity)
        
        let swipeDirection: Direction?
        if absVelocity.width > absVelocity.height {
            swipeDirection = absVelocity.width >= minAbsSpeedForSwipe
            ? velocity.width < 0 ? .left : .right
            : nil
        } else {
            swipeDirection = absVelocity.height >= minAbsSpeedForSwipe
            ? velocity.height < 0 ? .up : .down
            : nil
        }
        
        if let swipeDirection = swipeDirection {
            onSwipe(swipeDirection, dragOffset)
        } else {
            onDropped?(dragOffset)
        }
    }
}
