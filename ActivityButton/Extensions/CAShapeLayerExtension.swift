//
//  CALayerExtension.swift
//  ActivityButton
//
//  Created by user on 21.10.2020.
//

import UIKit

extension CAShapeLayer {
    
    func animateStrokeStart(fromValue: CGFloat = 0, toValue: CGFloat = 1, delegate: CAAnimationDelegate? = nil) {
        let animation = CABasicAnimation(keyPath: .strokeStart)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = .duration
        animation.delegate = delegate
        animation.setValue(String.strokeStart, forKey: .strokeStart)

        add(animation, forKey: .strokeStart)
    }
    
    func animateStrokeEnd(fromValue: CGFloat = 0, toValue: CGFloat = 1, delegate: CAAnimationDelegate? = nil) {
        let animation = CABasicAnimation(keyPath: .strokeEnd)
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = .duration
        animation.delegate = delegate
        animation.setValue(String.strokeEnd, forKey: .strokeEnd)
        
        add(animation, forKey: .strokeEnd)
    }
    
    func animateRotation(fromValue: CGFloat = 0, toValue: CGFloat = 2 * CGFloat.pi, delegate: CAAnimationDelegate? = nil) {
        let animation = CABasicAnimation(keyPath: .rotationZ)
        animation.fromValue = fromValue
        animation.toValue = 2 * CGFloat.pi
        animation.duration = .duration * 1.5
        animation.repeatCount = .infinity
        animation.delegate = delegate
        
        add(animation, forKey: .rotationZ)
    }
    
}
