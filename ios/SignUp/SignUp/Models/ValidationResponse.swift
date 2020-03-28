//
//  ValidationResponse.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

protocol ValidationResponse {
    var isValid: Bool { get }
}

struct IDValidationResponse: Decodable, ValidationResponse {
    let status: String
    
    var isValid: Bool {
        return status == "OK"
    }
}
