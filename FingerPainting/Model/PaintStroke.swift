//
//  PaintStroke.swift
//  FingerPainting
//
//  Created by Timothy Adamcik on 6/3/20.
//  Copyright © 2020 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

struct PaintStroke {
    let strokeWidth: CGFloat
    let color: UIColor
    let path: StrokePath
}

struct StrokePath {
    let points: [CGPoint]
}

typealias PaintStrokeMemento = [String: Any]

protocol MementoStorable {
    var memento: PaintStrokeMemento { get }
    init?(memento: PaintStrokeMemento)
}

extension PaintStroke: MementoStorable {
    
    private struct MementoKeys {
        static let strokeWidth = "stroke_width"
        static let color = "color"
        static let path = "path"
    }

    var memento: PaintStrokeMemento {
        return [
            MementoKeys.strokeWidth: strokeWidth,
            MementoKeys.color: color,
            MementoKeys.path: path
        ]
    }

    init?(memento: PaintStrokeMemento) {
        guard let strokeWidth = memento[MementoKeys.strokeWidth] as? CGFloat,
            let color = memento[MementoKeys.color] as? UIColor,
            let path = memento[MementoKeys.path] as? StrokePath else {
                return nil
        }
        self.strokeWidth = strokeWidth
        self.color = color
        self.path = path
    }
}
