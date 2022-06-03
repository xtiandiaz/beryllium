//
//  UIDirectionalSwipeGestureRecognizer.swift
//  Emerald
//
//  Created by Cristian Diaz on 3.6.2022.
//

import SpriteKit

public final class UIDirectionalSwipeGestureRecognizer: UIPanGestureRecognizer {
    
    public var swipeDirection: UISwipeGestureRecognizer.Direction?
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesBegan(touches, with: event)
        
        swipeDirection = nil
        
        if let touch = touches.first {
            startTimestamp = touch.timestamp
            startLocation = touch.location(in: nil)
        }
    }
    
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesMoved(touches, with: event)
        
        if
            let currentTimestamp = touches.first?.timestamp,
            let startTimestamp = startTimestamp,
            currentTimestamp - startTimestamp > 0.35
        {
            touchesCancelled(touches, with: event)
        }
    }
    
    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent) {
        super.touchesEnded(touches, with: event)
        
        if
            let endLocation = touches.first?.location(in: nil),
            let startLocation = startLocation,
            startLocation.distance(to: endLocation) > 20
        {
            swipeDirection = UISwipeGestureRecognizer.Direction.fromPoint(startLocation, to: endLocation)
        }
    }
    
    // MARK: - Private
    
    private var startTimestamp: TimeInterval?
    private var startLocation: CGPoint?
}
