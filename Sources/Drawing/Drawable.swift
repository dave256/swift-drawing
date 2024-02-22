//
//  Drawable.swift
//
//
//  Created by David Reed on 2/22/24.
//

import SwiftUI

public protocol Drawable {
    func draw(context: GraphicsContext)
}

/// properties needed to draw a path with a given style and color
public protocol PathDrawable: Transformable {
    var path: Path { get }
    var drawStyle: DrawStyle { get }
}

/// allow empty conformance to Drawable for types that conform to PathDrawable with this default draw method
extension Drawable where Self: PathDrawable {
    /// draw using path, drawStyle, and transforms with the context
    /// - Parameter context: GraphicsContext to draw with
    public func draw(context: GraphicsContext) {
        // first apply the Drawable's transform and then the context's transform
        // as we later set context's transform to the identity
        let tfm = transform.concatenating(context.transform)
        // transform the path otherwise the lineWidth is also scaled
        let p = path.transform(tfm).path(in: .infinite)
        // get a copy so we can mutate it
        var context = context
        // set context's transform to identity since we transformed the path
        context.transform = .identity

        switch drawStyle.style {
        case .path:
            // draw outline
            context.stroke(p, with: .color(drawStyle.color.color))
        case .closed:
            var p = p
            // close path and draw outline
            p.closeSubpath()
            context.stroke(p, with: .color(drawStyle.color.color))
        case .filled:
            // draw filled shape
            context.fill(p, with: .color(drawStyle.color.color))
        }
    }
}
