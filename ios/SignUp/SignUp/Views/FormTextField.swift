//
//  FormTextField.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

@IBDesignable
class FormTextField: UITextField {
    
    enum Appearance {
        case normal
        case focused
        case invalid
    }
    
    @IBInspectable var inset: CGFloat = 0
    
    var appearance: Appearance {
        didSet { setAppearance(to: appearance) }
    }
    
    override init(frame: CGRect) {
        appearance = .normal
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        appearance = .normal
        super.init(coder: coder)
    }
    
    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(with: inset))
    }
    
    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(with: inset))
    }
    
    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: UIEdgeInsets(with: inset))
    }
    
    func setAppearance(to appearance: Appearance) {
        switch appearance {
        case .normal: layer.borderColor = UIColor.borderGray.cgColor
        case .focused: layer.borderColor = UIColor.selectedBlue.cgColor
        case .invalid: layer.borderColor = UIColor.invalidRed.cgColor
        }
    }
}

extension UIEdgeInsets {
    init(with inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
}
