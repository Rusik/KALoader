//
//  KALoader.swift
//  KALoader
//
//  Created by Kirill Averyanov on 08/09/2017.
//  Copyright © 2017 Kirill Averyanov. All rights reserved.
//

import Foundation

internal class KALoaderView: UIView {
    private var gradientLayer: CAGradientLayer

    private static let defaultGradientAnimationDuration: TimeInterval = 2
    private var gradientAnimationDuration: TimeInterval = 2
    private let widthRatio = 3.0
    private let gradientRatio = 0.2

    private let colors = (
        background: UIColor(white: 0.97, alpha: 1),
        moving: UIColor(white: 0.9, alpha: 1)
    )

    override init(frame: CGRect) {
        gradientLayer = CAGradientLayer()
        super.init(frame: frame)

        // Use -0.1 value instead of 0 due to strange bug with static 1 point width line on start
        gradientLayer.startPoint = CGPoint(x: -0.1, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 0)

        set(colors: colors)

        gradientLayer.locations = [
            NSNumber(value: 0),
            NSNumber(value: 1 - gradientRatio),
            NSNumber(value: 1),
            NSNumber(value: 1 + gradientRatio),
            NSNumber(value: widthRatio - gradientRatio),
            NSNumber(value: widthRatio),
            ].map { NSNumber(value: $0.doubleValue - (widthRatio - 1) ) }

        gradientLayer.frame = frame
        layer.insertSublayer(gradientLayer, at: 0)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func set(colors: (background: UIColor, moving: UIColor), animationDuration: TimeInterval = defaultGradientAnimationDuration) {

        gradientLayer.colors = [
            colors.background.cgColor,
            colors.background.cgColor,
            colors.moving.cgColor,
            colors.background.cgColor,
            colors.background.cgColor,
            colors.moving.cgColor,
        ]

        self.gradientAnimationDuration = animationDuration
    }

    func startAnimateLayer() {
        let gradientAnimation = CABasicAnimation(keyPath: "locations")
        gradientAnimation.fromValue = gradientLayer.locations
        gradientLayer.locations = gradientLayer.locations?.map { NSNumber(value: $0.doubleValue + (widthRatio - 1) ) }

        gradientAnimation.duration = gradientAnimationDuration
        gradientAnimation.fillMode = kCAFillModeForwards
        gradientAnimation.repeatCount = .infinity
        gradientLayer.add(gradientAnimation, forKey: nil)
    }

    func stopAnimateLayer() {
        gradientLayer.removeAllAnimations()
    }
}
