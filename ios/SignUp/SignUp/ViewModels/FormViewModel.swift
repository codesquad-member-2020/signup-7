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
        if !conformsIDRule(input) {
            UpdateEvent.id(result: .invalid(.invalidRule)).post()
            return
        }
        
        idDuplicationCheck(input) { UpdateEvent.id(result: $0).post() }
    }
    
    private func conformsIDRule(_ id: String) -> Bool {
        if id.count < 5 || id.count > 20 { return false }
        
        let regexPattern = #"[^a-z0-9_-]"#
        let matches = try! NSRegularExpression(pattern: regexPattern)
            .matches(in: id, range: NSRange(id.startIndex..., in: id))
        
        return matches.count == 0
    }
    
    private func idDuplicationCheck(_ id: String,
                                    completion: @escaping (ValidationResult<IDSuccess, IDError>) -> Void) {
        Networking.requestValidation(withID: id) { result in
            switch result {
            case .failure: completion(.invalid(.networkError))
            case let .success(response):
                if response.isValid { completion(.valid(.success)) }
                else { completion(.invalid(.alreadyExisting)) }
            }
        }
    }
}
