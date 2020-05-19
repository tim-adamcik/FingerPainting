//
//  FingerPaintingViewController.swift
//  FingerPainting
//
//  Created by Timothy Adamcik on 5/15/20.
//  Copyright © 2020 Timothy Adamcik. All rights reserved.
//

import UIKit

class FingerPaintingViewController: UIViewController {
    @IBOutlet weak var undoBtn: UIButton!
    @IBOutlet weak var redoBtn: UIButton!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var settingsBtn: UIButton!
    @IBOutlet weak var tempImageView: UIImageView!
    
    
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
            swiped = false
            lastPoint = touch.location(in: self.view)
        
    }
    
    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint ) {
        UIGraphicsBeginImageContext(view.frame.size)

        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        tempImageView.image?.draw(in: view.bounds)
        
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        
        context.strokePath()
        
        tempImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        tempImageView.alpha = opacity
        
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        swiped = true
        let currentPoint = touch.location(in: view)
        drawLine(from: lastPoint, to: currentPoint)
        
        lastPoint = currentPoint
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
        
        UIGraphicsBeginImageContext(view.frame.size)
        mainImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: 1.0)
        tempImageView.image?.draw(in: view.bounds, blendMode: .normal, alpha: opacity)
        mainImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        tempImageView.image = nil

    }
    @IBAction func undoBtnPressed(_ sender: Any) {
    }
    
    @IBAction func clearBtnPressed(_ sender: Any) {
    }
    
    @IBAction func redoBtnPressed(_ sender: Any) {
    }
    
    @IBAction func settingsBtnPressed(_ sender: Any) {
    }
}

