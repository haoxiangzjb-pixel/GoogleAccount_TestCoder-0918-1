//
//  RandomlyNamedViewController.swift
//  RandomApp
//
//  Created by Assistant on 2023-10-27.
//

import UIKit

class RandomlyNamedViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set a background color for visibility
        self.view.backgroundColor = UIColor.systemBackground
        
        // Add a label as an example UI element
        let label = UILabel()
        label.text = "Hello from RandomlyNamedViewController!"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(label)
        
        // Add constraints to center the label
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
}