//
//  NetService.swift
//  PryanikyTestTask
//
//  Created by Vit K on 14.07.2020.
//  Copyright © 2020 Vit K. All rights reserved.
//

import Foundation

class NetService {
    
    static func loadData(completion: @escaping (Result<Data, Error>) -> Void ) {
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "pryaniky.com"
        urlComponents.path = "/static/json/sample.json"
        let request = URLRequest(url: urlComponents.url!)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print("SOME ERROR")
                    completion(.failure(error))
                    return
                }
                guard let data = data else { return }
                do {
                    let group = try JSONDecoder().decode(Data.self, from: data)
                    completion(.success(group))
                    print(group)
                } catch let jsonError {
                    print("FAILED TO DECODE JSON", jsonError)
                    completion(.failure(jsonError))
                }
            }
        }.resume()
    }
}
