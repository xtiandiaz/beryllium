//
//  UIViewControllerExtensions.swift
//  BerilioUI
//
//  Created by Cristian Diaz on 2.12.2022.
//

import Foundation
import SnapKit
import UIKit

extension UIViewController {
    
    public var childModalViewController: UIViewController? {
        if presentedViewController?.presentingViewController == self {
            return presentedViewController
        }
        
        return nil
    }
    
    public func addChildViewController(_ child: UIViewController, withFrame frame: CGRect? = nil) {
        view.addSubview(child.view)
        
        if let frame {
            child.view.frame = frame
        }
        
        addChild(child)
        child.didMove(toParent: self)
    }
    
    public func addAndConstrainChildViewController(
        _ child: UIViewController,
        withFrame frame: CGRect? = nil,
        _ makeConstraints: (ConstraintMaker) -> Void
    ) {
        addChildViewController(child, withFrame: frame)
        
        child.view.snp.makeConstraints {
            makeConstraints($0)
        }
    }
    
    public func removeFromParentViewController() {
        guard !parent.isNil else {
            return
        }
        
        willMove(toParent: nil)
        removeFromParent()
        view.removeFromSuperview()
    }
}
