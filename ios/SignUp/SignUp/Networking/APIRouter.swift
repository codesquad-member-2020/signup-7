//
//  APIRouter.swift
//  SignUp
//
//  Created by Chaewan Park on 2020/03/28.
//  Copyright © 2020 Chaewan Park. All rights reserved.
//

import Foundation

enum APIRouter {
    case validateID(id: String)
    
    private var path: String {
        switch self {
        case .validateID: return Endpoints.idValidationRequestURL
        }
    }
    
    private var query: String {
        switch self {
        case let .validateID(id: id): return "userId=\(id)"
        }
    }
    
    var url: URL? {
        guard var urlComponents = URLComponents(string: path) else { return nil }
        urlComponents.query = query
        return urlComponents.url
    }
}
