//
//  SettingsViewController.swift
//  FingerPainting
//
//  Created by Timothy Adamcik on 5/20/20.
//  Copyright © 2020 Timothy Adamcik. All rights reserved.
//

import Foundation
import UIKit

protocol SettingsViewControllerDelegate: class {
  func settingsViewControllerFinished(_ settingsViewController: SettingsViewController)
}


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
    
    weak var delegate: SettingsViewControllerDelegate?
    
    
    var brush: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var red: CGFloat = 0.0
    var green: CGFloat = 0.0
    var blue: CGFloat = 0.0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        brushSlider.value = Float(brush)
        brushWidthLabel.text = "\(brushSlider.value)"
        opacityLevelLabel.text = "\(opacitySlider.value)"
        redSlider.value = Float(red * 255)
        redValueLabel.text = Int(redSlider.value).description
        greenSlider.value = Float(green * 255)
        greenValueLabel.text = Int(greenSlider.value).description
        blueSlider.value = Float(blue * 255)
        blueValueLabel.text = Int(blueSlider.value).description
        drawPreview()
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

    @IBAction func colorSliderMoved(_ sender: Any) {
        red = CGFloat(redSlider.value / 255.0)
        redValueLabel.text = Int(redSlider.value).description
        green = CGFloat(greenSlider.value / 255.0)
        greenValueLabel.text = Int(greenSlider.value).description
        blue = CGFloat(blueSlider.value / 255.0)
        blueValueLabel.text = Int(blueSlider.value).description
            
        drawPreview()

    }
    
    
    @IBAction func closeBtnPressed(_ sender: Any) {
        delegate?.settingsViewControllerFinished(self)
        dismiss(animated: true, completion: nil)
    }
    
}
