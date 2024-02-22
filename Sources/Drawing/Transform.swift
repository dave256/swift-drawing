//
//  Transform.swift
//
//
//  Created by David Reed on 2/22/24.
//

import SwiftUI

/// a 2D rotation, scale, or translation transformation
public enum Transform: Equatable {
    // rotation angle in degrees
    case r(Double)
    // scale x and scale y
    case s(Double, Double)
    // translate x and translate y
    case t(Double, Double)
}

public extension [Transform] {
    /// apply the transformations in the order they are in the array
    var combined: CGAffineTransform {
        var result = CGAffineTransform.identity
        for tfm in self {
            switch tfm {
                case let .r(degrees):
                    result = result.concatenating(.init(rotationAngle: degrees * Double.pi / 180.0))

                case let .s(sx, sy):
                    result = result.concatenating(.init(scaleX: sx, y: sy))

                case let .t(tx, ty):
                    result = result.concatenating(.init(translationX: tx, y: ty))
            }
        }
        return result
    }
}

public protocol Transformable {
    var transforms: [Transform] { get }
}

public extension Transformable {
    /// default computed property  for any Transformable type that combines all the transformations in the transforms array in the array order
    var transform: CGAffineTransform {
        transforms.combined
    }
}
