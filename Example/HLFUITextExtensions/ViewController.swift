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
    @IBOutlet var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabelExample()
        setUpTextViewExample()
    }

    func setUpLabelExample() {
        label.font = .preferredFont(forTextStyle: .title1)
        label.textAlignment = .center
        label.textColor = .darkText
        label.hlf_updateText("Hello, playground. You are looking okay.")

        label.hlf_setKerning(-0.5)
        label.hlf_setLineHeight(label.hlf_pointsByEms(1.1))
        label.hlf_updateText("Hello, playground. You are looking good.")

        label.sizeToFit()
    }

    func setUpTextViewExample() {
        textView.font = .preferredFont(forTextStyle: .title1)
        textView.textAlignment = .center
        textView.textColor = .darkText
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: -4)
        textView.hlf_updateText("Hello, playground. You are looking okay.")

        textView.hlf_setKerning(-0.5)
        textView.hlf_setLineHeight(label.hlf_pointsByEms(1.1))
        textView.hlf_updateText("Hello, playground. You are looking good.")

        textView.sizeToFit()
    }

}
