//
//  Shapes.swift
//
//
//  Created by David Reed on 2/22/24.
//

import SwiftUI

/// square with sides of  length one centered at  (0, 0)
public struct UnitSquare: PathDrawable, Equatable {
    /// init
    /// - Parameters:
    ///   - name: optional name/comment for the shape
    ///   - drawStyle: how to draw the shape
    ///   - transforms: transforms to apply to the shape in the order they are in the array
    public init(name: String = "", drawStyle: DrawStyle, transforms: [Transform]) {
        self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        self.drawStyle = drawStyle
        self.transforms = transforms
    }
    
    /// name/comment for the shape
    public var name: String
    /// style with which to draw shape
    public var drawStyle: DrawStyle
    /// transforms to apply to shape
    public var transforms: [Transform]
    /// the shape's path (computed property as PrinterParser requires memberwise init to match memory layout of instance vars)
    public var path: Path {
        Path { path in
            path.move(to: CGPoint(x: -0.5, y: -0.5))
            path.addLine(to: CGPoint(x: -0.5, y: 0.5))
            path.addLine(to: CGPoint(x: 0.5, y: 0.5))
            path.addLine(to: CGPoint(x: 0.5, y: -0.5))
            path.addLine(to: CGPoint(x: -0.5, y: -0.5))
        }
    }
}

/// circle with radius one centered at (0, 0)
/// note this will be larger than the unit square - for it to be similar, it would need to have radius 0.5
public struct UnitCircle: PathDrawable, Equatable {
    /// init
    /// - Parameters:
    ///   - name: optional name/comment for the shape
    ///   - drawStyle: how to draw the shape
    ///   - transforms: transforms to apply to the shape in the order they are in the array
    public init(name: String = "", drawStyle: DrawStyle, transforms: [Transform]) {
        self.name = name.trimmingCharacters(in: .whitespacesAndNewlines)
        self.drawStyle = drawStyle
        self.transforms = transforms
    }

    /// name/comment for the shape
    public var name: String
    /// style with which to draw shape
    public var drawStyle: DrawStyle
    /// transforms to apply to shape
    public var transforms: [Transform]
    /// the shape's path (computed property as PrinterParser requires memberwise init to match memory layout of instance vars)
    public var path: Path {
        Path(ellipseIn: CGRect(x: -1.0, y: -1.0, width: 2.0, height: 2.0))
    }
}

// use default Drawable draw implementation since these are PathDrawable
extension UnitCircle: Drawable {}
extension UnitSquare: Drawable {}
