//
//  FormButton.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/25.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

@IBDesignable
class FormButton: UIButton {
    
    @IBInspectable var borderColor: UIColor? {
        didSet { layer.borderColor = borderColor?.cgColor }
    }

    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet { layer.borderWidth = borderWidth }
    }
    
    @IBInspectable var contentInset: CGFloat = 0 {
        didSet { contentEdgeInsets = UIEdgeInsets(horizontalInset: contentInset) }
    }
}

extension UIEdgeInsets {
    init(horizontalInset inset: CGFloat) {
        self.init(top: 0, left: inset, bottom: 0, right: inset)
    }
}
