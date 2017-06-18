//
//  TextExtensions.swift
//  HLFUITextExtensions
//
//  Created by Peng Wang on 06/11/2017.
//  Copyright (c) 2017 Peng Wang. All rights reserved.
//

public protocol TextExtensions: class {

    var hlf_attributedText: NSAttributedString? { get set }
    var hlf_text: String? { get set }

    var hlf_font: UIFont? { get }
    var hlf_textColor: UIColor? { get }

    var textAlignment: NSTextAlignment { get }

    func hlf_attributesFromProperties() -> [String : Any]
    func hlf_pointsByEms(_ ems: CGFloat) -> CGFloat
    func hlf_setKerning(_ points: CGFloat)
    func hlf_setLineHeight(_ points: CGFloat)
    func hlf_updateText(_ text: String)

}

extension TextExtensions {

    public var hlf_attributedText: NSAttributedString? {
        get {
            switch self {
            case let label as UILabel: return label.attributedText
            case let textField as UITextField: return textField.attributedText
            case let textView as UITextView: return textView.attributedText
            default: return nil
            }
        }
        set {
            switch self {
            case let label as UILabel: label.attributedText = newValue
            case let textField as UITextField: textField.attributedText = newValue
            case let textView as UITextView: textView.attributedText = newValue
            default: break
            }
        }
    }
    public var hlf_text: String? {
        get {
            switch self {
            case let label as UILabel: return label.text
            case let textField as UITextField: return textField.text
            case let textView as UITextView: return textView.text
            default: return nil
            }
        }
        set {
            switch self {
            case let label as UILabel: label.text = newValue
            case let textField as UITextField: textField.text = newValue
            case let textView as UITextView: textView.text = newValue
            default: break
            }
        }
    }

    public var hlf_font: UIFont? {
        switch self {
        case let label as UILabel: return label.font
        case let textField as UITextField: return textField.font
        case let textView as UITextView: return textView.font
        default: return nil
        }
    }
    public var hlf_textColor: UIColor? {
        switch self {
        case let label as UILabel: return label.textColor
        case let textField as UITextField: return textField.textColor
        case let textView as UITextView: return textView.textColor
        default: return nil
        }
    }

    public func hlf_attributesFromProperties() -> [String : Any] {
        var attributes = hlf_attributedText?.attributes(at: 0, effectiveRange: nil)
            ?? [String : Any]()
        attributes[NSFontAttributeName] = hlf_font
        attributes[NSForegroundColorAttributeName] = hlf_textColor
        let paragraphStyle = (
                attributes[NSParagraphStyleAttributeName] as? NSParagraphStyle
            )?.mutableCopy() as? NSMutableParagraphStyle
            ?? NSMutableParagraphStyle()
        paragraphStyle.alignment = textAlignment
        attributes[NSParagraphStyleAttributeName] = paragraphStyle
        return attributes
    }

    public func hlf_pointsByEms(_ ems: CGFloat) -> CGFloat {
        guard let font = hlf_font else { return 0 }
        return round(ems * font.pointSize)
    }

    public func hlf_setKerning(_ points: CGFloat) {
        guard let text = hlf_text else { return assertionFailure() }
        var attributes = hlf_attributesFromProperties()
        attributes[NSKernAttributeName] = points
        hlf_attributedText = NSAttributedString(string: text, attributes: attributes)
    }

    public func hlf_setLineHeight(_ points: CGFloat) {
        guard let text = hlf_text else { return assertionFailure() }
        var attributes = hlf_attributesFromProperties()
        let paragraphStyle = attributes[NSParagraphStyleAttributeName]
            as! NSMutableParagraphStyle
        paragraphStyle.maximumLineHeight = points
        attributes[NSParagraphStyleAttributeName] = paragraphStyle
        hlf_attributedText = NSAttributedString(string: text, attributes: attributes)
    }

    public func hlf_updateText(_ text: String) {
        guard hlf_attributedText != nil else {
            self.hlf_text = text
            return
        }
        let attributes = hlf_attributesFromProperties()
        hlf_attributedText = NSAttributedString(string: text, attributes: attributes)
    }

}

extension UILabel: TextExtensions {}

extension UITextField: TextExtensions {}

extension UITextView: TextExtensions {}
