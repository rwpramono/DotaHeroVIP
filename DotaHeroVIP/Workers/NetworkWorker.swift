//
//  NetworkWorker.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation

protocol NetworkWorkingLogic {
    func sendRequest(to: URL, params: [String: String], completion: @escaping (Data?, Error?) -> Void)
}

final class NetworkWorker: NetworkWorkingLogic {
        
    private let session = URLSession.shared
        
    func sendRequest(to: URL, params: [String: String], completion: @escaping (Data?, Error?) -> Void) {
        guard var urlComponents = URLComponents(url: to, resolvingAgainstBaseURL: false) else {
            completion(nil, nil)
            return
        }
        
        urlComponents.queryItems = params.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
        
        guard let requestURL = urlComponents.url else {
            completion(nil, nil)
            return
        }
        
        let request = session.dataTask(with: requestURL) { (data, response, error) in
            OperationQueue.main.addOperation {
                if let error = error {
                    completion(nil, error)
                    return
                }
                
                completion(data, nil)
            }
        }
        
        request.resume()
    }
}
