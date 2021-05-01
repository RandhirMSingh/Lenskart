//
//  NetworkService.swift
//  Lenskart
//
//  Created by Kumar Singh, Randhir on 01/05/21.
//

import Foundation

enum NetworkError: Error {
    case unexpectedData
    case resourceNotFound
}

class NetworkService<T: Codable> {
    typealias NetworkServiceResponse = (Result<T, NetworkError>) -> Void//
    
    func get(url: URL? = nil, completion: @escaping NetworkServiceResponse) {
        //Return Mocked Data
        guard let data = Bundle.read(contentsOf: "movies", ofType: "json") else {
            //failure with cutom error
            completion(.failure(.resourceNotFound))
            return
        }
        
        do {
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(parsedData))
        } catch {
            //failure with cutom error
            completion(.failure(.unexpectedData))
        }
    }
}
