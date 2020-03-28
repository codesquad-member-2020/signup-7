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
        UpdateEvent.id(result: .invalid(.invalidRule)).post()
    }
}
