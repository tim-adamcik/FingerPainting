//
//  PaintStrokeSaver.swift
//  FingerPainting
//
//  Created by Timothy Adamcik on 6/3/20.
//  Copyright © 2020 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

//class PaintStrokeSaver {
//    static let shared = PaintStrokeSaver()
//
//    func save(paintStrokes: [PaintStroke], name: String) {
//        let defaults = UserDefaults.standard
//        defaults.synchronize()
//    }
//
//    func restore(name: String) -> [PaintStroke] {
//        let defaults = UserDefaults.standard
//        guard let mementos = defaults.object(forKey: name) as? [Memento] else {
//            return []
//        }
//        var paintStrokes = [PaintStroke]()
//        for memento in mementos {
//            if let paintStroke = PaintStroke(memento: memento) {
//                paintStrokes.append(paintStroke)
//            }
//        }
//        return paintStrokes
//    }
//}
