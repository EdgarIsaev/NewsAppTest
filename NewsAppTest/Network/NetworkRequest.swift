//
//  NetworkRequest.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 23.10.2023.
//

import Foundation

class NetworkRequest {
    
    static let shared = NetworkRequest()
    private init(){}
    
    func requestData(completion: @escaping(Result<Data, Error>) -> Void) {
        let urlString = "https://newsdata.io/api/1/news?country=us&apikey=pub_3147894e5485a2f7bee35010bd1941b4eb958"
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            DispatchQueue.main.async {
                if let error = error {
                    completion(.failure(error))
                }
                
                guard let data = data else { return }
                completion(.success(data))
            }
        }
        .resume()
    }
}
