//
//  NSAttributedStringExtensions.swift
//  Beryllium
//
//  Created by Cristian Diaz on 9.12.2022.
//

import Foundation
import UIKit

extension NSAttributedString {
    
    public var fullRange: NSRange {
        return NSMakeRange(0, length)
    }
    
    public convenience init(image: UIImage, textStyle: UIFont.TextStyle) {
        self.init(attachment: NSTextAttachment().configure {
            $0.image = image
            
            let textSize = UIFont.preferredFont(forTextStyle: textStyle).pointSize
            let imageSize = image.size
            let yOffset = (textSize - imageSize.height) / 2 - 1
            
            $0.bounds = CGRect(origin: .init(y: yOffset), size: image.size)
        })
    }
}

extension NSMutableAttributedString {
    
    @discardableResult
    public func setParagraphStyle(_ block: (NSMutableParagraphStyle) -> Void) -> Self {
        let style = NSMutableParagraphStyle()
        block(style)
        addAttribute(.paragraphStyle, value: style, range: fullRange)
        return self
    }
}

