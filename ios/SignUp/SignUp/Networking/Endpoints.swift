//
//  Endpoints.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Endpoints {
    static let baseURL = "https://heroku-test-signup.herokuapp.com"
    static let validationRequestURL = "\(baseURL)/validate"
    
    static let idValidationRequestURL = "\(validationRequestURL)/available"
    static let mobileValidationRequestURL = "\(validationRequestURL)/available"
    static let emailValidationRequestURL = "\(validationRequestURL)/subscription"
}
