//
//  TextExtensions.swift
//  HLFUITextExtensions
//
//  Created by Peng Wang on 06/11/2017.
//  Copyright (c) 2017 Peng Wang. All rights reserved.
//

protocol TextExtensions: class {

    var attributedText: NSAttributedString? { get set }
    var text: String? { get set }

    var font: UIFont! { get set }
    var textAlignment: NSTextAlignment { get set }
    var textColor: UIColor! { get set }

    func hlf_attributesFromProperties() -> [String : Any]
    func hlf_pointsByEms(_ ems: CGFloat) -> CGFloat
    func hlf_setKerning(_ points: CGFloat)
    func hlf_setLineHeight(_ points: CGFloat)
    func hlf_updateText(_ text: String)

}

extension TextExtensions {

    public func hlf_attributesFromProperties() -> [String : Any] {
        var attributes = attributedText?.attributes(at: 0, effectiveRange: nil)
            ?? [String : Any]()
        attributes[NSFontAttributeName] = font
        attributes[NSForegroundColorAttributeName] = textColor
        let paragraphStyle = (
                attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle
            )?.mutableCopy() as? NSMutableParagraphStyle
            ?? NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        attributes[NSParagraphStyleAttributeName] = paragraphStyle
        return attributes
    }

    public func hlf_pointsByEms(_ ems: CGFloat) -> CGFloat {
        return round(ems * font.pointSize)
    }

    public func hlf_setKerning(_ points: CGFloat) {
        guard let text = text else { return assertionFailure() }
        var attributes = hlf_attributesFromProperties()
        attributes[NSKernAttributeName] = points
        attributedText = NSAttributedString(string: text, attributes: attributes)
    }

    public func hlf_setLineHeight(_ points: CGFloat) {
        guard let text = text else { return assertionFailure() }
        var attributes = hlf_attributesFromProperties()
        let paragraphStyle = attributes[NSParagraphStyleAttributeName]
            as! NSMutableParagraphStyle
        paragraphStyle.maximumLineHeight = points
        attributes[NSParagraphStyleAttributeName] = paragraphStyle
        attributedText = NSAttributedString(string: text, attributes: attributes)
    }

    public func hlf_updateText(_ text: String) {
        guard attributedText != nil else {
            self.text = text
            return
        }
        let attributes = hlf_attributesFromProperties()
        attributedText = NSAttributedString(string: text, attributes: attributes)
    }

}

extension UILabel: TextExtensions {}
