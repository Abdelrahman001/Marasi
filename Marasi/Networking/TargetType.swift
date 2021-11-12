//
//  TargetType.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    /// A request with no additional data.
    case requestPlain
}

protocol TargetType {
    var baseURL: URLEnvironment { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: URLs.Paths { get }
    
    /// The HTTP method used in the request.
    var method: HTTPMethod { get }
    
    /// The type of HTTP task to be performed.
    var task: Task { get }
    
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}
