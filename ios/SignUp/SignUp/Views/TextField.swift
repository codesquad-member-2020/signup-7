//
//  TextField.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/24.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class TextField: UITextField {
    
    enum Appearance {
        case normal
        case focused
        case invalid
    }
    
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
    
    func setAppearance(to appearance: Appearance) {
        switch appearance {
        case .normal: layer.borderColor = UIColor.borderGray.cgColor
        case .focused: layer.borderColor = UIColor.selectedBlue.cgColor
        case .invalid: layer.borderColor = UIColor.invalidRed.cgColor
        }
    }
}
