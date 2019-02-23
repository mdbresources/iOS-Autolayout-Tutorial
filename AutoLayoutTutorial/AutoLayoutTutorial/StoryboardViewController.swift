//
//  StoryboardViewController.swift
//  AutoLayoutTutorial
//
//  Created by Anmol Parande on 2/22/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class StoryboardViewController: UIViewController {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = "Storyboard"
    }
    
    @IBAction func changeText(_ sender: Any) {
        titleLabel.text = "Hello"
    }
    
}
