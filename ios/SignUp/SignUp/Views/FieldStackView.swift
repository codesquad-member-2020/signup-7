//
//  FieldStackView.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class FieldStackView: UIStackView {
    
    @IBOutlet var formTextField: UITextField!
    @IBOutlet var descriptionLabel: UILabel!
    
    enum Appearance {
        case normal
        case valid(message: String)
        case invalid(message: String)
    }
    
    var appearance: Appearance = .normal {
        didSet { setAppearance(to: appearance) }
    }
    
    private func setAppearance(to appearance: Appearance) {
        switch appearance {
        case .normal: layer.borderColor = UIColor.borderGray.cgColor
        case let .valid(message): setAppearanceValid(with: message)
        case let .invalid(message): setAppearanceInvalid(with: message)
        }
    }
    
    private func setAppearanceInvalid(with message: String) {
        formTextField.layer.borderColor = UIColor.invalidRed.cgColor
        descriptionLabel.textColor = UIColor.invalidRed
        descriptionLabel.text = message
    }
    
    private func setAppearanceValid(with message: String) {
        formTextField.layer.borderColor = UIColor.pointGreen.cgColor
        descriptionLabel.textColor = UIColor.pointGreen
        descriptionLabel.text = message
    }
}
