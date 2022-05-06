//
//  RunnableAsync.swift
//  Beryllium
//
//  Created by Cristian Diaz on 5.5.2022.
//

import Foundation

public protocol RunnableAsync {
    
    var isRunning: Bool { get }
    
    func start() async
    func stop() async
}
