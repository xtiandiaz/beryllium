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
    
    public convenience init(
        symbol: String,
        textStyle: UIFont.TextStyle = .body
    ) {
        let image = UIImage.symbol(symbol, withTextStyle: textStyle)
        
        self.init(image: image)
    }
    
    public convenience init(
        string: String,
        color: UIColor,
        textStyle: UIFont.TextStyle = .body,
        alignment: NSTextAlignment = .left
    ) {
        self.init(
            string: string,
            attributes: [
                .foregroundColor: color,
                .font: UIFont.font(forTextStyle: textStyle),
                .paragraphStyle: NSMutableParagraphStyle().configure {
                    $0.alignment = alignment
                }
            ]
        )
    }
    
    public convenience init(image: UIImage) {
        self.init(attachment: NSTextAttachment(image: image))
    }
    
    public func prependSymbol(
        _ symbol: String?,
        withTextStyle textStyle: UIFont.TextStyle
    ) -> NSAttributedString {
        guard let symbol else {
            return self
        }
        
        let attributes = self.attributes(at: 0, effectiveRange: nil)
        let mutableString = NSMutableAttributedString(
            attributedString: .init(symbol: symbol, textStyle: textStyle)
        ).configure {
            $0.append(.init(string: String(repeating: .nonbreakingSpace, count: 2)))
            $0.append(self)
            $0.addAttributes(attributes, range: fullRange)
        }
        
        return mutableString
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

