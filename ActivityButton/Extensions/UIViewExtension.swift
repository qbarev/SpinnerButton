//
//  UIViewExtension.swift
//  ActivityButton
//
//  Created by user on 21.10.2020.
//

import UIKit

extension UIView {
    
    func constraintToSuperviewBorder() {
        guard let superview = superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: superview.leadingAnchor),
            topAnchor.constraint(equalTo: superview.topAnchor),
            trailingAnchor.constraint(equalTo: superview.trailingAnchor),
            bottomAnchor.constraint(equalTo: superview.bottomAnchor)
        ])
    }
    
    func constraintToSuperviewCenter() {
        guard let superview = superview else { return }
        
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            centerYAnchor.constraint(equalTo: superview.centerYAnchor),
            centerXAnchor.constraint(equalTo: superview.centerXAnchor)
        ])
    }
    
    func disable() {
        isUserInteractionEnabled = false
    }
    
    func enable() {
        isUserInteractionEnabled = true
    }
    
    func animateScale(x: CGFloat, y: CGFloat) {
        UIView.animate(withDuration: .duration / 3,
                       delay: 0,
                       options: .curveEaseInOut,
                       animations: { [weak self] in
                        self?.transform = CGAffineTransform(scaleX: x, y: y)
                       })
    }
    
}

