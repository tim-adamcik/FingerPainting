//
//  PaintStrokeUndoManager.swift
//  FingerPainting
//
//  Created by Timothy Adamcik on 6/3/20.
//  Copyright © 2020 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

class PaintStrokeUndoManager {
    static let shared = PaintStrokeUndoManager()

    private(set) var activeStrokes = [PaintStroke]()
    private var undidStrokes = [PaintStroke]()

    private init() { }

    func add(stroke: PaintStroke) {
        activeStrokes.append(stroke)
    }

    func redo() {
        guard !undidStrokes.isEmpty else { return }
        let mostRecentUndidStroke = undidStrokes.removeLast()
        add(stroke: mostRecentUndidStroke)
    }

    func undo() {
        guard !activeStrokes.isEmpty else { return }
        let mostRecentStroke = activeStrokes.removeLast()
        undidStrokes.append(mostRecentStroke)
    }
}
