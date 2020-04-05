//
//  FormTextFieldDelegate.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/26.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import UIKit

class FormTextFieldDelegate: NSObject {
    
    let formViewModel: FormViewModel
    
    init(with viewModel: FormViewModel) {
        self.formViewModel = viewModel
        super.init()
    }
}

extension FormTextFieldDelegate: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = (textField.text ?? "") as NSString
        formViewModel.validate(text.replacingCharacters(in: range, with: string))
        return true
    }
}
