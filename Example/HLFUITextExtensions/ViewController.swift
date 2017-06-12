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

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpLabelExample()
    }

    func setUpLabelExample() {
        label.backgroundColor = .clear
        label.font = .preferredFont(forTextStyle: .title1)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.textColor = .darkText
        label.hlf_updateText("Hello, playground. You are looking okay.")

        label.hlf_setKerning(-0.5)
        label.hlf_setLineHeight(label.hlf_pointsByEms(1.1))
        label.hlf_updateText("Hello, playground. You are looking good.")

        label.sizeToFit()
    }

}
