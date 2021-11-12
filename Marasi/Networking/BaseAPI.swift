//
//  BaseAPI.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import UIKit

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Decodable>(target: T, responseClass: M.Type, completion:@escaping (Result<M, MarasiError>) -> Void) -> URLSessionTask {
        let url = URL(string: target.baseURL.getBaseURL()+target.path.absolutePath)!
        var request = URLRequest(url: url)
        request.httpMethod = target.method.rawValue
        request.allHTTPHeaderFields = target.headers
        
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            if let _ = error {
                DispatchQueue.main.async {
                completion(.failure(.unabelToComplete))
                }
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                DispatchQueue.main.async {
                completion(.failure(.invalidResponse))
                }
                return
            }
            
            guard let saveData = data else {
                DispatchQueue.main.async {
                    completion(.failure(.invalidData))
                }
                return
            }
            
            let decoder = JSONDecoder()
            do {
                let jsonObj = try decoder.decode(M.self, from: saveData)
                DispatchQueue.main.async {
                    completion(.success(jsonObj))
                }
            } catch {
                DispatchQueue.main.async {
                completion(.failure(.invalidData))
                }
            }
        }
        task.resume()
        return task
    }
}
