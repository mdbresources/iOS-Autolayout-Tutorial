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
    
    var stackView: UIStackView!
    
    var textLabel: UILabel!
    
    private let padding: CGFloat = 10.0
    
    private var landscapeConstraints: [NSLayoutConstraint] = []
    private var portraitConstraints: [NSLayoutConstraint] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        createViews()
        setupRedViewConstraints()
        setUpStackViewConstraints()
        setUpTextLabel()
        amendConstraints()
    }
    
    private func createViews() {
        redView = UIView()
        redView.backgroundColor = .red
        self.redView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(redView)
        
        textLabel = UILabel()
        self.redView.addSubview(textLabel)
        
        self.blueView = UIView()
        blueView.backgroundColor = .blue
        
        self.greenView = UIView()
        greenView.backgroundColor = .green
        
        stackView = UIStackView(arrangedSubviews: [self.blueView, self.greenView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.alignment = .fill
        stackView.spacing = padding
        self.view.addSubview(stackView)
    }
    
    private func amendConstraints() {
        print("Changed rotation")
        NSLayoutConstraint.deactivate(landscapeConstraints + portraitConstraints)
        if (self.traitCollection.verticalSizeClass == .compact) {
            stackView.axis = .vertical
            NSLayoutConstraint.activate(landscapeConstraints)
        } else {
            stackView.axis = .horizontal
            NSLayoutConstraint.activate(portraitConstraints)
        }
    }
    
    private func setupRedViewConstraints() {
        redView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding).isActive = true
        
        redView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding).isActive = true
        
        landscapeConstraints.append(self.stackView.leadingAnchor.constraint(equalTo: self.redView.trailingAnchor, constant: padding))
        landscapeConstraints.append(self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.redView.bottomAnchor, constant: padding))
        
        portraitConstraints.append(self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: redView.trailingAnchor, constant: padding))
        
        redView.widthAnchor.constraint(equalTo: redView.heightAnchor, multiplier: 1.0).isActive = true
    }
    
    private func setUpStackViewConstraints() {
        self.blueView.widthAnchor.constraint(equalTo: self.greenView.widthAnchor, multiplier: 1.0).isActive = true
        self.blueView.heightAnchor.constraint(equalTo: self.greenView.heightAnchor, multiplier: 1.0).isActive = true
        
        landscapeConstraints.append(stackView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: padding))
        
        portraitConstraints.append(stackView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: padding))
        portraitConstraints.append(stackView.topAnchor.constraint(equalTo: self.redView.bottomAnchor, constant: padding))
        
        self.view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: padding).isActive = true
        
        self.view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: padding).isActive = true
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
        super.traitCollectionDidChange(previousTraitCollection)
        amendConstraints()
    }
}
