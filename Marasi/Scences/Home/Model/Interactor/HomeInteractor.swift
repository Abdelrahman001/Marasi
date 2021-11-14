//
//  HomeInteractor.swift
//  Marasi
//
//  Created by Abdelrahman Hassan on 12/11/2021.
//

import Foundation

class HomeInteractor: BaseAPI<HomeNetworking> {
    
    func homeRequest(completion: @escaping (Result<Home, MarasiError>) -> Void) {
        let homeNetworking = HomeNetworking.homeRequest
        
        let _ = self.fetchData(target: homeNetworking, responseClass: Home.self) { result in
            switch result {
            case .success(let response):
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
