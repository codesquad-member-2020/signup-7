//
//  Networking.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

class Networking {
    static let shared = Networking()
    
    func requestValidation(withID id: String,
                           completion: @escaping (Result<ValidationResponse, Error>) -> Void) {
        guard let url = APIRouter.validateID(id: id).url else { return }
        
        URLSession(configuration: .default).dataTask(with: url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else { return }
            do {
                let response = try JSONDecoder().decode(IDValidationResponse.self, from: data)
                completion(.success(response))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    private init() { }
}
