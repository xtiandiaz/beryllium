//
//  UIViewExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 13.12.2022.
//

import Foundation
import UIKit

extension UIView {
    
    public var isVisible: Bool {
        get { !isHidden }
        set { isHidden = !newValue }
    }
    
    public var intrinsicWidth: CGFloat {
        intrinsicContentSize.width
    }
    
    public var intrinsicHeight: CGFloat {
        intrinsicContentSize.height
    }
    
    public convenience init(cornerRadius: CGFloat, backgroundColor: UIColor) {
        self.init()
        
        self.backgroundColor = backgroundColor
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
    
    public convenience init(backgroundColor: UIColor) {
        self.init()
        
        self.backgroundColor = backgroundColor
    }
    
    public static func roundedView(withHeight height: CGFloat, backgroundColor: UIColor) -> UIView {
        UIView(cornerRadius: height / 2, backgroundColor: backgroundColor)
    }
    
    public func addSubviews(_ subviews: [UIView]) {
        subviews.forEach { addSubview($0) }
    }
    
    public func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    public func addSubviews(_ subviews: UIView?...) {
        subviews.compactMap { $0 }.forEach { addSubview($0) }
    }
    
    public func dropShadow() {
        with(layer) {
            $0.masksToBounds = false
            $0.shadowColor = UIColor.black.cgColor
            $0.shadowOpacity = 0.5
            $0.shadowOffset = CGSize(width: -1, height: 1)
            $0.shadowRadius = 1
            $0.shadowPath = UIBezierPath(rect: self.bounds).cgPath
//            $0.shouldRasterize = true
//            $0.rasterizationScale = UIScreen.main.scale
        }
    }
}
