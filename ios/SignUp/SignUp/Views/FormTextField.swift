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
    
    @IBInspectable var inset: CGFloat = 0
    
    @IBInspectable var borderColor: UIColor? {
        didSet { layer.borderColor = borderColor?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth }
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
}

extension UIEdgeInsets {
    init(with inset: CGFloat) {
        self.init(top: inset, left: inset, bottom: inset, right: inset)
    }
}
