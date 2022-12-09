//
//  UIStackViewExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 9.12.2022.
//

import Foundation
import UIKit

extension UIStackView {
    
    public func addArrangedSubviews(_ views: UIView...) {
        views.forEach { addArrangedSubview($0) }
    }
    
    public func fullyRemoveAllArrangedSubviews() {
        arrangedSubviews.forEach { fullyRemoveArrangedSubview($0) }
    }
    
    public func fullyRemoveArrangedSubview(_ subview: UIView) {
        removeArrangedSubview(subview)
        NSLayoutConstraint.deactivate(subview.constraints)
        subview.removeFromSuperview()
    }
    
    public func setLayoutMargins(_ margins: UIEdgeInsets) {
        isLayoutMarginsRelativeArrangement = true
        layoutMargins = margins
    }
}
