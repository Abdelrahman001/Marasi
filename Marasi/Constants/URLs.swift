//
//  URLs.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import Foundation

struct URLs {
    enum Paths {
        case home
        
        var absolutePath: String {
            switch self {
            case .home:
                return "/task/response.json"
            }
        }
    }
}

enum URLEnvironment: String {
    case baseURL
    
    func getBaseURL() -> String {
        switch self {
        case .baseURL:
            return "http://178.128.171.40"
        }
    }
}
