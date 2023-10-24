//
//  NetworkImageRequest.swift
//  NewsAppTest
//
//  Created by Эдгар Исаев on 23.10.2023.
//

import UIKit

class NetworkImageRequest {
    
    static let shared = NetworkImageRequest()
    private init(){}
    
    func imageFetch(imageUrl: String?, completion: @escaping(Result<UIImage, Error>) -> Void) {
        guard let urlString = imageUrl else { return }
        guard let url = URL(string: urlString) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            DispatchQueue.main.async {
                if let error = error {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
                guard let data = data, let image = UIImage(data: data) else { return }
                completion(.success(image))
            }
        }
        .resume()
    }
}
