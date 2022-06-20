//
//  HomeScreenWorker.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation

protocol HomeWorkingLogic {
    func fetchDatas(_ completion: @escaping ([DotaHeroResponse]?) -> Void)
}

final class HomeWorker: HomeWorkingLogic {
    private let networkWorker: NetworkWorkingLogic = NetworkWorker()
    private let datasURL = URL(string: "https://api.opendota.com/api/herostats")
        
    func fetchDatas(_ completion: @escaping ([DotaHeroResponse]?) -> Void) {
        guard let datasURL = datasURL else {
            completion(nil)
            return
        }
        
        networkWorker.sendRequest(to: datasURL, params: [:]) { (data, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            let decoder = JSONDecoder()
            let datas = try? decoder.decode([DotaHeroResponse].self, from: data)
            
            completion(datas)
        }
    }
}
