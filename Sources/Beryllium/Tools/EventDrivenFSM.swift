//
//  EventDrivenFSM.swift
//  Beryllium
//
//  Created by Cristian Diaz on 30.4.2022.
//

import Foundation

public final class EventDrivenFSM<S: Hashable, E: Hashable>: Runnable, Configurable {
    
    public private(set) var state: S?
    public private(set) var isRunning = false
    
    public init(initialState: S) {
        self.initialState = initialState
    }
    
    public func start() {
        guard !isRunning else {
            return
        }
        
        enter(initialState)
        
        isRunning = true
    }
    
    public func stop() {
        guard isRunning else {
            return
        }
        
        isRunning = false
        
        exit(state)
        state = nil
    }
    
    @discardableResult
    public func addState(_ state: S, onEnter: (() -> Void)?) -> StateWrapper<S, E> {
        addState(state, onEnter: onEnter, onExit: nil)
    }
    
    @discardableResult
    public func addState(
        _ state: S,
        onEnter: (() -> Void)? = nil,
        onExit: (() -> Void)? = nil
    ) -> StateWrapper<S, E> {
        let wrapper = StateWrapper<S, E>(key: state, onEnter: onEnter, onExit: onExit)
        stateWrappers[state] = wrapper
        return wrapper
    }
    
    public func sendEvent(_ event: E) {
        guard isRunning else {
            print("Machine is not running")
            return
        }
        
        guard let state = state, let nextState = wrapper(for: state).transitions[event]?() else {
            print("No transition defined for event '\(event)'")
            return
        }
        
        enter(nextState)
    }
    
    // MARK: - Private
    
    private let initialState: S
    
    private var stateWrappers = [S: StateWrapper<S, E>]()
    
    private func enter(_ state: S) {
        exit(self.state)
        
        self.state = state
        
        wrapper(for: state).onEnter?()
    }
    
    private func exit(_ state: S?) {
        if let state = state {
            wrapper(for: state).onExit?()
        }
    }
    
    private func wrapper(for state: S) -> StateWrapper<S, E> {
        guard let state = stateWrappers[state] else {
            fatalError("Undefined wrapper for state '\(state)'")
        }
        
        return state
    }
}

extension EventDrivenFSM {
    
    public final class StateWrapper<S: Hashable, E: Hashable> {
        
        public typealias Transition = () -> S
        
        public let key: S
        
        @discardableResult
        public func onEvent(_ event: E, transition: @escaping Transition) -> Self {
            transitions[event] = transition
            return self
        }
        
        // MARK: - Internal
        
        let onEnter: (() -> Void)?
        let onExit: (() -> Void)?
        
        private(set) var transitions = [E: Transition]()
        
        init(key: S, onEnter: (() -> Void)?, onExit: (() -> Void)?) {
            self.key = key
            self.onEnter = onEnter
            self.onExit = onExit
        }
    }
}
