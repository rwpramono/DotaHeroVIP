//
//  HomeScreenInteractor.swift
//  DotaHeroVIP
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation

protocol HomeBusinessLogic {
    func fetchDatas(_ request: HomeModels.FetchHeroes.Request)
    func selectHero(_ request: HomeModels.SelectHero.Request)
}

protocol HomeDataStore {
    var heroes: [DotaHeroResponse] { get }
    var selectedHero: DotaHeroResponse? { get }
}

final class HomeInteractor: HomeBusinessLogic, HomeDataStore {
    var presenter: HomePresentationLogic?
    lazy var worker: HomeWorkingLogic = HomeWorker()
    
    var heroes: [DotaHeroResponse] = []
    var selectedHero: DotaHeroResponse?
    
    func fetchDatas(_ request: HomeModels.FetchHeroes.Request) {
        worker.fetchDatas { dataResult in
            guard let dataResult = dataResult else {
                return
            }
            
            let response = HomeModels.FetchHeroes.Response(heores: dataResult)
            
            self.heroes = dataResult
            self.presenter?.presentFetchedHeroes(response)
        }
    }
    
    func selectHero(_ request: HomeModels.SelectHero.Request) {
        guard !heroes.isEmpty, request.index < heroes.count else {
            return
        }
        
        selectedHero = heroes[request.index]
    }
}
