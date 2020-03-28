//
//  FormViewModel.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/26.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

final class FormViewModel {
    
    private var userInformation: UserInformation?
    
    func validate(_ input: String) {
        if isNotConformingIDRule(input) {
            UpdateEvent.id(result: .invalid(.invalidRule)).post()
        } else if isExistingID(input) {
            UpdateEvent.id(result: .invalid(.alreadyExisting)).post()
        } else {
            UpdateEvent.id(result: .valid(.success)).post()
        }
    }
    
    private func isNotConformingIDRule(_ id: String) -> Bool {
        return true
    }
    
    private func isExistingID(_ id: String) -> Bool {
        return false
    }
}
