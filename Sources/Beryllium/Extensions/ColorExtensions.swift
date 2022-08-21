//
//  ColorExtensions.swift
//  Beryllium
//
//  Created by Cristian Díaz on 18.7.2021.
//

import SwiftUI

struct Components {
    
    let red: Double
    let green: Double
    let blue: Double
    let alpha: Double
}

extension Color {
    
    public static var random: Color {
        let red = Double.random(in: 0...1)
        let green = Double.random(in: 0...1)
        let blue = Double.random(in: 0...1)
        return Color(.sRGB, red: red, green: green, blue: blue, opacity: 1)
    }
    
    public func darkened(by factor: CGFloat) -> Color {
        Color(uiColor.darkened(by: factor))
    }
    
    public func lightened(by factor: CGFloat) -> Color {
        Color(uiColor.lightened(by: factor))
    }
    
    public func lerp(to: Color, at t: Double) -> Color {
        Color(uiColor.lerp(to: to.uiColor, at: t))
    }
    
    // MARK: - Internal
    
    var uiColor: UIColor {
        UIColor(self)
    }
}

extension Color: Codable {
    
    public static func * (lhs: Color, rhs: Color) -> Color {
        Color(lhs.uiColor * rhs.uiColor)
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let red = try container.decode(Double.self, forKey: .red)
        let green = try container.decode(Double.self, forKey: .green)
        let blue = try container.decode(Double.self, forKey: .blue)
        let alpha = try container.decode(Double.self, forKey: .alpha)
        self.init(Components(red: red, green: green, blue: blue, alpha: alpha))
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        let components = self.uiColor.components
        try container.encode(components.red, forKey: .red)
        try container.encode(components.green, forKey: .green)
        try container.encode(components.blue, forKey: .blue)
        try container.encode(components.alpha, forKey: .alpha)
    }
    
    // MARK: - Internal
    
    init(_ components: Components) {
        self.init(
            .sRGB,
            red: components.red,
            green: components.green,
            blue: components.blue,
            opacity: components.alpha
        )
    }
    
    // MARK: - Private

    private enum CodingKeys: String, CodingKey {
        case red
        case green
        case blue
        case alpha
    }
}

extension UIColor {
    
    public var rgba: [CGFloat] {
        var r: CGFloat = 0
        var g: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        return [r, g, b, a]
    }
    
    public var hex: String {
        let shift = { [comps = rgba] (index: Int, by: Int) in
            (Int)(comps[index] * 255) << by
        }
        
        return String(format: "#%06x", shift(0, 16) | shift(1, 8) | shift(2, 0))
    }
    
    public var hexa: String {
        let shift = { [comps = rgba] (index: Int, by: Int) in
            (Int)(comps[index] * 255) << by
        }
        return String(format: "#%08x", shift(0, 24) | shift(1, 16) | shift(2, 8) | shift(3, 0))
    }
    
    public convenience init(
        light lightSchemeColor: @escaping @autoclosure () -> UIColor,
        dark darkSchemeColor: @escaping @autoclosure () -> UIColor
    ) {
        self.init {
            $0.userInterfaceStyle == .dark ? darkSchemeColor() : lightSchemeColor()
        }
    }
    
    public static func * (lhs: UIColor, rhs: UIColor) -> UIColor {
        let lhsComps = lhs.components
        let rhsComps = rhs.components
        
        return UIColor(
            red: lhsComps.red * rhsComps.red,
            green: lhsComps.green * rhsComps.green,
            blue: lhsComps.blue * rhsComps.blue,
            alpha: lhsComps.alpha * rhsComps.alpha
        )
    }
    
    public func resolvedFor(colorScheme: ColorScheme) -> UIColor {
        resolvedColor(with: .init(userInterfaceStyle: colorScheme.uiUserInterfaceStyle))
    }
    
    public func lerp(to: UIColor, at t: Double) -> UIColor {
        let fromComps = components
        let toComps = to.components
        
        return UIColor(
            red: fromComps.red.lerp(to: toComps.red, at: t),
            green: fromComps.green.lerp(to: toComps.green, at: t),
            blue: fromComps.blue.lerp(to: toComps.blue, at: t),
            alpha: fromComps.alpha.lerp(to: toComps.alpha, at: t)
        )
    }
    
    public func lightened(by factor: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            return UIColor(
                hue: h,
                saturation: min(max(s - factor * s, 0), 1),
                brightness: max(min(b + factor * (1 - b), 1), 0),
                alpha: a
            )
        }
        
        return self
    }
    
    public func darkened(by factor: CGFloat) -> UIColor {
        var h: CGFloat = 0, s: CGFloat = 0, b: CGFloat = 0, a: CGFloat = 0
        
        if getHue(&h, saturation: &s, brightness: &b, alpha: &a) {
            return UIColor(
                hue: h,
                saturation: s,
                brightness: max(min(b - abs(factor) * b, 1), 0),
                alpha: a
            )
        }
        
        return self
    }
    
    // MARK: - Internal
    
    var components: Components {
        let rgba = self.rgba
        return Components(red: rgba[0], green: rgba[1], blue: rgba[2], alpha: rgba[3])
    }
}
