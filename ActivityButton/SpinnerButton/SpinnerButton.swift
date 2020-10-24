//
//  SpinnerButton.swift
//  ActivityButton
//
//  Created by user on 21.10.2020.
//

import UIKit

typealias EmptyBlock = () -> ()

class SpinnerButton: UIView {

    //MARK: - Property list
    
    var buttonAction: EmptyBlock?
    
    private let button = UIButton()
    private let spinner = SpinnerView()
    
    private var cachedColor: UIColor?
    
    //MARK: - Initialization

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        setup()
    }
    
    //MARK: - Public methods
    
    func startAnimating() {
        button.disable()
        cachedColor = button.titleLabel?.textColor
        button.setTitleColor(.clear, for: .normal)
        spinner.startAnimating()
    }
    
    func stopAnimating() {
        button.enable()
        spinner.stopAnimating()
        button.setTitleColor(cachedColor, for: .normal)
    }
    
    //MARK: - Actions
    
    @objc private func buttonPressedDown(_ sender: UIButton) {
        animateDecrease()
    }
    
    @objc private func buttonPressed(_ sender: UIButton) {
        animateIncrease()
        buttonAction?()
    }
    
    @objc private func buttonPressedOutside(_ sender: UIButton) {
        animateIncrease()
    }
    
    //MARK: - Private methods
    
    private func setup() {
        setupApperiance()
        setupButton()
        setupSpinner()
    }
    
    private func setupApperiance() {
        backgroundColor = .clear
    }
    
    private func setupButton() {
        button.addTarget(self, action: #selector(buttonPressedDown(_:)), for: .touchDown)
        button.addTarget(self, action: #selector(buttonPressed(_:)), for: .touchUpInside)
        button.addTarget(self, action: #selector(buttonPressedOutside(_:)), for: .touchUpOutside)
        button.addTarget(self, action: #selector(buttonPressedOutside(_:)), for: .touchCancel)
        button.layer.cornerRadius = .cornerRadius
        button.setTitle("Button", for: .normal)
        button.backgroundColor = .systemBlue
        addSubview(button)
        button.constraintToSuperviewBorder()
    }
    
    private func setupSpinner() {
        spinner.color = .white
        addSubview(spinner)
        spinner.constraintToSuperviewCenter()
    }
    
    private func animateDecrease() {
        animateScale(x: 0.9, y: 0.9)
    }
    
    private func animateIncrease() {
        animateScale(x: 1, y: 1)
    }
    
}
