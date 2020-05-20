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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func brushSliderMoved(_ sender: Any) {
    }
    
    @IBAction func opacitySliderMoved(_ sender: Any) {
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
