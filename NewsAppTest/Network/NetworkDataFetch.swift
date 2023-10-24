//
//  NetworkDataFetch.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 23.10.2023.
//

import Foundation

class NetworkDataFetch {
    
    static let shared = NetworkDataFetch()
    private init(){}
    
    func fetchNews (response: @escaping(News?, Error?) -> Void) {
        
        NetworkRequest.shared.requestData { result in
            switch result {
                
            case .success(let data):
                do {
                    let news = try JSONDecoder().decode(News.self, from: data)
                    response(news, nil)
                } catch let jsonError {
                    print ("Failed to decode JSON", jsonError)
                }
            case .failure(let error):
                print(error.localizedDescription)
                response(nil, error)
            }
        }
    }
}
