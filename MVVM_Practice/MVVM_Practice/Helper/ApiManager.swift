//
//  ApiManager.swift
//  MVVM_Practice
//
//  Created by Adarsh Singh on 04/09/23.
//

import Foundation

enum DataError: Error{
    
    case invalidResponse
    case invalidURL
    case invalidDecoding
    case network(Error?)
    
}

class ApiManager{
    
    static let shared = ApiManager()
    
    init(){}
    
    func fetchData(completion: @escaping (Result<Matches, DataError>) -> Void){
        guard let url = URL(string: Constant.Api.api) else{
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            guard let data, error == nil else{
                completion(.failure(.invalidResponse))
                return
            }
            
            guard let response = response as? HTTPURLResponse,
                  200...299 ~= response.statusCode else{
                completion(.failure(.invalidResponse))
                
                return
            }
            
            do{
                let matches = try JSONDecoder().decode(Matches.self, from: data)
                completion(.success(matches))
                
            }catch{
                completion(.failure(.network(error)))
            }
            
            
        }.resume()
        
    }
}
