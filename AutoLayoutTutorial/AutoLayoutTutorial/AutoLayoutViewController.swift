//
//  AutoLayoutViewController.swift
//  AutoLayoutTutorial
//
//  Created by Anmol Parande on 2/21/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class AutoLayoutViewController: UIViewController {
    var redView: UIView!
    var blueView: UIView!
    var greenView: UIView!
    
    var innerStackView: UIStackView!
    var outerStackView: UIStackView!
    
    var textLabel: UILabel!
    
    private let padding: CGFloat = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createViews()
        setupSizeConstraints()
        setUpStackViewConstraints()
        setUpTextLabel()
        amendConstraints()
    }
    
    private func createViews() {
        //Create all the Views
    }
    
    private func amendConstraints() {
        print("Changed rotation")
        //Alter constraints based on rotation
    }
    
    private func setupSizeConstraints() {
        //Setup constraints dealing with the size of UI elements
    }
    
    private func setUpStackViewConstraints() {
        //Setup constraints dealing with the outer stack view
    }
    
    private func setUpTextLabel() {
        //Set up the text label
    }
    
    //Implement method which allow rotation (make sure you call amendConstraints() in the method)
}
