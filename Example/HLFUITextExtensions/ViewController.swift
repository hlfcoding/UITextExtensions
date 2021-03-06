//
//  ViewController.swift
//  HLFUITextExtensions
//
//  Created by Peng Wang on 06/11/2017.
//  Copyright (c) 2017 Peng Wang. All rights reserved.
//

import UIKit
import HLFUITextExtensions

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!
    @IBOutlet var textField: UITextField!
    @IBOutlet var textView: UITextView!

    @IBOutlet var captions: [UILabel]!
    @IBOutlet var containers: [UIView]!

    let font: UIFont = .systemFont(ofSize: 27, weight: UIFontWeightLight)
    let textAlignment: NSTextAlignment = .center
    let textColor: UIColor = .darkText

    override func viewDidLoad() {
        super.viewDidLoad()
        captions.forEach() { $0.layer.cornerRadius = 5 }
        containers.forEach() { $0.layer.cornerRadius = 10 }
        setUpLabelExample()
        setUpTextFieldExample()
        setUpTextViewExample()
    }

    func setUpLabelExample() {
        label.font = font
        label.textAlignment = textAlignment
        label.textColor = textColor
        setUpCommonExample(view: label)
        label.sizeToFit()
    }

    func setUpTextFieldExample() {
        textField.font = font
        textField.textAlignment = textAlignment
        textField.textColor = textColor
        setUpCommonExample(view: textField)
    }

    func setUpTextViewExample() {
        textView.font = font
        textView.textAlignment = textAlignment
        textView.textColor = textColor
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: -4)
        setUpCommonExample(view: textView)
        textView.sizeToFit()
    }

    func setUpCommonExample(view: TextExtensions) {
        let compliment = (okay: "You're looking okay.", good: "You're looking good.")
        let kerning: CGFloat = -0.5
        guard !(view is UITextField) else {
            view.hlf_updateText(compliment.okay)
            view.hlf_setKerning(kerning)
            view.hlf_updateText(compliment.good)
            return
        }
        view.hlf_updateText("Hello, playground. \(compliment.okay)")
        view.hlf_setKerning(kerning)
        view.hlf_setLineHeight(view.hlf_pointsByEms(1.1))
        view.hlf_updateText("Hello, playground. \(compliment.good)")
    }

}
