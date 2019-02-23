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
        redView = UIView()
        redView.backgroundColor = .red
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        
        textLabel = UILabel()
        self.redView.addSubview(textLabel)
        
        self.blueView = UIView()
        blueView.backgroundColor = .blue
        self.blueView.translatesAutoresizingMaskIntoConstraints = false
        
        self.greenView = UIView()
        greenView.backgroundColor = .green
        self.greenView.translatesAutoresizingMaskIntoConstraints = false
        
        innerStackView = UIStackView(arrangedSubviews: [self.blueView, self.greenView])
        innerStackView.translatesAutoresizingMaskIntoConstraints = false
        innerStackView.alignment = .fill
        innerStackView.distribution = .fillEqually
        innerStackView.spacing = padding
        
        outerStackView = UIStackView(arrangedSubviews: [self.redView, self.innerStackView])
        outerStackView.translatesAutoresizingMaskIntoConstraints = false
        outerStackView.alignment = .fill
        outerStackView.spacing = padding
        
        self.view.addSubview(outerStackView)
    }
    
    private func amendConstraints() {
        print("Changed rotation")
        if (self.traitCollection.verticalSizeClass == .compact) {
            innerStackView.axis = .vertical
            outerStackView.axis = .horizontal
        } else {
            innerStackView.axis = .horizontal
            outerStackView.axis = .vertical
        }
    }
    
    private func setupSizeConstraints() {
        let aspectConstrait = redView.widthAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1.0)
        aspectConstrait.priority = UILayoutPriority(999)
        aspectConstrait.isActive = true
    }
    
    private func setUpStackViewConstraints() {
        self.outerStackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        self.outerStackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        self.outerStackView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -padding).isActive = true
        self.outerStackView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -padding).isActive = true
    }
    
    private func setUpTextLabel() {
        textLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold)
        textLabel.textColor = .white
        textLabel.text = "Programmatic :)"
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.textLabel.centerXAnchor.constraint(equalTo: self.redView.centerXAnchor, constant: 10).isActive = true
        self.textLabel.centerYAnchor.constraint(equalTo: self.redView.centerYAnchor, constant: 10).isActive = true
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        amendConstraints()
        super.traitCollectionDidChange(previousTraitCollection)
    }
}
