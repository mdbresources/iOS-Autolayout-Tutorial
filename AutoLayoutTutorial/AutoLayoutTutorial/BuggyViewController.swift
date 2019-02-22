//
//  ViewController.swift
//  AutoLayoutTutorial
//
//  Created by Anmol Parande on 2/21/19.
//  Copyright © 2019 Anmol Parande. All rights reserved.
//

import UIKit

class BuggyViewController: UIViewController {
    var redView: UIView!
    var blueView: UIView!
    var greenView: UIView!
    var textLabel: UILabel!
    
    private let padding: CGFloat = 10.0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setUpRedView()
        setUpBlueView()
        setUpGreenView()
    }
    
    private func setUpRedView() {
        let width = self.view.frame.width - 2 * padding
        let height = width
        
        redView = UIView(frame: CGRect(x: padding, y: padding, width: width, height: height))
        redView.backgroundColor = .red
        
        textLabel = UILabel(frame: CGRect(x: width / 2 - 150, y: height / 2 - 25, width: 300, height: 50))
        textLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        textLabel.textColor = .white
        textLabel.text = "No Autolayout :("
        textLabel.textAlignment = .center
        self.redView.addSubview(textLabel)
        
        self.view.addSubview(redView)
    }
    
    private func setUpBlueView() {
        let y = redView.frame.maxY+padding
        let width = self.view.frame.width / 2 - 1.5 * padding
        let height = self.view.frame.height - self.redView.frame.height - padding * 3
        
        blueView = UIView(frame: CGRect(x: padding, y: y, width: width, height: height))
        blueView.backgroundColor = .blue
        
        self.view.addSubview(blueView)
    }
    
    private func setUpGreenView() {
        let x = self.blueView.frame.maxX + padding
        
        greenView = UIView(frame: CGRect(x: x, y: self.blueView.frame.minY, width: self.blueView.frame.width, height: self.blueView.frame.height))
        greenView.backgroundColor = .green
        
        self.view.addSubview(greenView)
    }
}

