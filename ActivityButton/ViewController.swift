//
//  ViewController.swift
//  ActivityButton
//
//  Created by user on 10.10.2020.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Property list

    @IBOutlet weak var spinnerButton: SpinnerButton!
    
    //MARK: - Overrides
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSpinnerButton()
    }
    
    //MARK: - Private methods
    
    private lazy var action: EmptyBlock = { [weak self] in
        self?.spinnerButton.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 5, repeats: false) { [weak self]  _ in
            self?.spinnerButton.stopAnimating()
        }
    }
    
    private func setupSpinnerButton() {
        spinnerButton.buttonAction = action
    }
    
}

