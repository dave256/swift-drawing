//
//  DrawStyle.swift
//
//
//  Created by David Reed on 2/22/24.
//

import SwiftUI

public struct DrawStyle: Equatable {

    /// init
    /// - Parameters:
    ///   - style: how to draw
    ///   - color: color to use for drawing
    public init(style: DrawStyle.Style, color: DrawStyle.Color) {
        self.style = style
        self.color = color
    }

    /// how to draw the shape (line for Polyline does not close the loop, shape is outline, and filled draws it filled)
    /// automatic parser generation since enum conforms to String, CaseIterable, and Equatable
    public enum Style: String, CaseIterable, Equatable {
        case path
        case closed
        case filled
    }

    /// enumerated type for a number of the SwiftUI Color values
    /// automatic parser generation since enum conforms to String, CaseIterable, and Equatable
    public enum Color: String, CaseIterable, Equatable {
        case black
        case blue
        case brown
        case clear
        case cyan
        case gray
        case green
        case indigo
        case mint
        case orange
        case pink
        case purple
        case red
        case teal
        case white
        case yellow

        public var color: SwiftUI.Color {
            switch self {
                case .black:
                    return .black
                case .blue:
                    return .blue
                case .brown:
                    return .brown
                case .clear:
                    return .clear
                case .cyan:
                    return .cyan
                case .gray:
                    return .gray
                case .green:
                    return .green
                case .indigo:
                    return .indigo
                case .mint:
                    return .mint
                case .orange:
                    return .orange
                case .pink:
                    return .pink
                case .purple:
                    return .purple
                case .red:
                    return .red
                case .teal:
                    return .teal
                case .white:
                    return .white
                case .yellow:
                    return .yellow
            }
        }
    }

    public var style: Style
    public var color: Color
}
