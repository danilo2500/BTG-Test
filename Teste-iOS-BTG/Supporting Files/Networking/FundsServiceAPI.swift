//
//  FundsServiceAPI.swift
//  Teste-iOS-BTG
//
//  Created by Danilo Henrique on 30/01/19.
//  Copyright © 2019 BTG Pactual. All rights reserved.
//

import Moya

enum FundsServiceAPI {
    case fundsList
}

extension FundsServiceAPI: TargetType {
    
    var baseURL: URL {
        return URL(string: Constants.baseUrl)!
    }
    
    var path: String {
        switch self {
        case .fundsList:
            return "/services/public/funds/"
        }
    }
    
    var method: Method {
        switch self {
        case .fundsList:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .fundsList:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .fundsList:
            return ["content-type": "application/json"]
        }
    }
    
}




























