//
//  UpdateEvent.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/26.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum Result<Error> {
    case valid
    case invalid(Error)
}

enum IDError: Error {
    case invalidRule
    case alreadyExisting
    
    var description: String {
        switch self {
        case .invalidRule: return "5~20자의 영문 소문자, 숫자와 특수기호(_)(-) 만 사용 가능합니다."
        case .alreadyExisting: return "이미 사용중인 아이디입니다."
        }
    }
}

enum UpdateEvent {
    case id(result: Result<IDError>)
    
    func post() {
        switch self {
        case .id(result: _): UpdateEvent.center.post(name: UpdateEvent.idValidationResultDidUpdate, object: self)
        }
    }
}

extension UpdateEvent {
    static let center = NotificationCenter.default
    static let idValidationResultDidUpdate = Notification.Name(rawValue: "NewMessage")
}
