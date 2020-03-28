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
            return
        }
        
        idDuplicationCheck(input) { UpdateEvent.id(result: $0).post() }
    }
    
    private func isNotConformingIDRule(_ id: String) -> Bool {
        return false
    }
    
    private func idDuplicationCheck(_ id: String,
                                    completion: @escaping (ValidationResult<IDSuccess, IDError>) -> Void) {
        Networking.shared.requestValidation(withID: id) { result in
            switch result {
            case .failure: completion(.invalid(.networkError))
            case let .success(response):
                if response.isValid { completion(.valid(.success)) }
                else { completion(.invalid(.alreadyExisting)) }
            }
        }
    }
}
