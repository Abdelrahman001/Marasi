//
//  HomeNetworking.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import Foundation

enum HomeNetworking {
    case homeRequest
}

extension HomeNetworking: TargetType {
    var baseURL: URLEnvironment {
        return .baseURL
    }
    
    var path: URLs.Paths {
        return .home
    }
    
    var method: HTTPMethod {
        return .get
    }
    
    var task: Task {
        return .requestPlain
    }
    
    var headers: [String : String]? {
        return [:]
    }
}
