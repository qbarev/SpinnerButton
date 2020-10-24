//
//  CAAnimationExtension.swift
//  ActivityButton
//
//  Created by user on 17.10.2020.
//

import UIKit

extension CAAnimation {
    
    ///A simplified way to pause an animation
    func pause() {
        speed = 0
    }
    
    ///A simplified way to play an animation
    func play() {
        speed = 1
    }
    
}
