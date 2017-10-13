//
//  ViewController.swift
//  iOS-Example
//
//  Created by Kirill Averyanov on 10/09/2017.
//  Copyright © 2017 Kirill Averyanov. All rights reserved.
//

import UIKit
import KALoader

class ViewController: UIViewController {

    @IBOutlet var testImageView: UIImageView! {
        didSet {
            testImageView.layer.cornerRadius = 5
            testImageView.layer.masksToBounds = true
        }
    }
    @IBOutlet var testImageView2: UIImageView! {
        didSet {
            testImageView2.layer.cornerRadius = 5
            testImageView2.layer.masksToBounds = true
        }
    }
    @IBOutlet var testLabelCollection: [UILabel]!
    @IBOutlet var testLabelCollection2: [UILabel]!
    @IBOutlet var testView: UIView! {
        didSet {
            testView.layer.cornerRadius = 5
            testView.layer.masksToBounds = true
        }
    }
    @IBOutlet var testTextView: UITextView! {
        didSet {
            testTextView.layer.cornerRadius = 5
            testTextView.layer.masksToBounds = true
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Any Setup
    }

    @IBAction func changeAnimationButtonAction(_ sender: Any) {
        // Purple
        let backColorPurple = UIColor(red: 189.0 / 255, green: 16.0 / 255, blue: 224.0 / 255, alpha: 1.0)
        let loadColorPurple = UIColor(red: 144.0 / 255, green: 19.0 / 255, blue: 254.0 / 255, alpha: 1.0)
        let colorsPurple = (backColorPurple, loadColorPurple)
        // Red
        let backColorRed = UIColor(red: 255.0 / 255, green: 75.0 / 255, blue: 97.0 / 255, alpha: 1.0)
        let loadColorRed = UIColor(red: 239.0 / 255, green: 64.0 / 255, blue: 85.0 / 255, alpha: 1.0)
        let colorsRed = (backColorRed, loadColorRed)
        // Green
        let backColorGreen = UIColor(red: 35.0 / 255, green: 222.0 / 255, blue: 37.0 / 255, alpha: 1.0)
        let loadColorGreen = UIColor(red: 25.0 / 255, green: 192.0 / 255, blue: 26.0 / 255, alpha: 1.0)
        let colorsGreen = (backColorGreen, loadColorGreen)

        if !testImageView.isLoaderShowing() {
            testImageView.showLoader()
            for label in testLabelCollection {
                label.showLoader()
            }

            testImageView2.showLoader(colors: colorsPurple, animationDuration: 1.5)
            for label in testLabelCollection2 {
                label.showLoader(colors: colorsPurple, animationDuration: 1.5)
            }

            testView.showLoader(colors: colorsRed, animationDuration: 0.5)
            testTextView.showLoader(colors: colorsGreen, animationDuration: 2)
        } else {
            testImageView.hideLoader()
            for label in testLabelCollection {
                label.hideLoader()
            }

            testImageView2.hideLoader()
            for label in testLabelCollection2 {
                label.hideLoader()
            }

            testView.hideLoader()
            testTextView.hideLoader()
        }
    }
}

