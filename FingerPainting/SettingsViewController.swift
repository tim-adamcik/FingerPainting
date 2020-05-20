//
//  SettingsViewController.swift
//  FingerPainting
//
//  Created by Timothy Adamcik on 5/20/20.
//  Copyright © 2020 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
   
    @IBOutlet weak var brushWidthLabel: UILabel!
    @IBOutlet weak var brushSlider: UISlider!
    @IBOutlet weak var opacityLevelLabel: UILabel!
    @IBOutlet weak var opacitySlider: UISlider!
    @IBOutlet weak var samplePenImageView: UIImageView!
    
    @IBOutlet weak var redValueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenValueLabel: UILabel!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueValueLabel: UILabel!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var customColorLabel: UIImageView!
    
    var brush: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brushWidthLabel.text = "\(brushSlider.value)"
        opacityLevelLabel.text = "\(opacitySlider.value)"
    }
    
    func drawPreview() {
        UIGraphicsBeginImageContext(samplePenImageView.frame.size)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        context.setLineCap(.round)
        context.setLineWidth(brush)
        context.setStrokeColor(UIColor(red: red, green: green, blue: blue, alpha: opacity).cgColor)
        
        context.move(to: CGPoint(x: samplePenImageView.bounds.height/2, y: samplePenImageView.bounds.width/2))
        context.addLine(to: CGPoint(x: samplePenImageView.bounds.height/2, y: samplePenImageView.bounds.width/2))
        context.strokePath()
        samplePenImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    
    @IBAction func brushSliderMoved(_ sender: Any) {
        brush = CGFloat(brushSlider.value)
        brushWidthLabel.text = String(format: "%.1f", brush)
        drawPreview()

    }
    
    @IBAction func opacitySliderMoved(_ sender: Any) {
        opacity = CGFloat(opacitySlider.value)
        opacityLevelLabel.text = String(format: "%.1f", opacity)
        drawPreview()
    }
    @IBAction func redSliderMoved(_ sender: Any) {
    }
    @IBAction func greenSliderMoved(_ sender: Any) {
    }
    
    @IBAction func blueSliderMoved(_ sender: Any) {
    }
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
