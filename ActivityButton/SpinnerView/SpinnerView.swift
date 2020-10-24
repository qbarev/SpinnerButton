//
//  ActivityIndicator.swift
//  ActivityButton
//
//  Created by user on 10.10.2020.
//

import UIKit

class SpinnerView: UIView {
    
    //MARK: - Types
    
    enum Style {
        case medium, large
        
        var defaultColor: UIColor {
            UIColor.systemGray2
        }
        
        var size: CGSize {
            switch self {
            case .medium:
                return CGSize(width: .width, height: .width)
            case .large:
                return CGSize(width: .width * 2, height: .width * 2)
            }
        }
        
        var lineWidth: CGFloat {
            switch self {
            case .medium:
                return .mediumLineWidth
            case .large:
                return .largeLineWidth
            }
        }
    }
    
    private enum State {
        case animating, stopped
    }

    //MARK: - Property list
    
    var hidesWhenStopped: Bool = false {
        didSet {
            hideIfNeeded()
        }
    }
    
    var color: UIColor? {
        set(newColor) {
            shapeLayer.strokeColor = newColor?.cgColor
        }
        get {
            shapeLayer.strokeColor?.uiColor
        }
    }
    
     var style: Style = .medium {
        didSet {
            redraw()
        }
    }
    
    private var state: State = .stopped {
        didSet {
            hideIfNeeded()
        }
    }
    
    private var shapeLayer: CAShapeLayer {
        layer as! CAShapeLayer
    }

    //MARK: - Overrides
    
    override class var layerClass: AnyClass {
        CAShapeLayer.self
    }
    
    override var intrinsicContentSize: CGSize {
        style.size
    }
    
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
        guard state != .animating else { return }
        state = .animating
        shapeLayer.animateRotation()
        shapeLayer.animateStrokeEnd(fromValue: shapeLayer.strokeEnd, delegate: self)
    }
    
    func stopAnimating() {
        guard state != .stopped else { return }
        state = .stopped
        shapeLayer.removeAllAnimations()
        shapeLayer.strokeEnd = 0
    }

    //MARK: - Private methods
    
    private func setup() {
        isUserInteractionEnabled = false
        let path = createPath()
        shapeLayer.path = path.cgPath
        shapeLayer.strokeColor = color?.cgColor ?? style.defaultColor.cgColor
        shapeLayer.lineWidth = style.lineWidth
        shapeLayer.fillColor = nil
        shapeLayer.strokeEnd = 0
        shapeLayer.lineCap = .round
    }
    
    private func redraw() {
        let path = createPath()
        shapeLayer.path = path.cgPath
        shapeLayer.lineWidth = style.lineWidth
    }
    
    private func hideIfNeeded() {
        shapeLayer.isHidden = state == .stopped && hidesWhenStopped
    }
    
    private func createPath() -> UIBezierPath {
        let origin = CGPoint(x: 0, y: 0)
        let rect = CGRect(origin: origin, size: style.size)
        let path = UIBezierPath(ovalIn: rect)
        return path
    }
    
    private func addStrokeStartAnimation() {
        shapeLayer.strokeEnd = 1
        shapeLayer.animateStrokeStart(delegate: self)
    }
    
    private func addStrokeEndAnimation() {
        shapeLayer.strokeEnd = 0
        shapeLayer.animateStrokeEnd(delegate: self)
    }
    
}

//MARK: - CAAnimationDelegate

extension SpinnerView: CAAnimationDelegate {

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        guard state != .stopped  else { return }
        
        if anim.value(forKey: .strokeEnd).isExist {
           addStrokeStartAnimation()
        } else if anim.value(forKey: .strokeStart).isExist {
            addStrokeEndAnimation()
        }
    }
    
}
