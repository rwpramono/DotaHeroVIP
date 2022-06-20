//
//  HomeBusinessLogicSpy.swift
//  DotaHeroVIPTests
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation
@testable import DotaHeroVIP

final class HomeBusinessLogicSpy: HomeBusinessLogic {
    func selectHero(_ request: HomeModels.SelectHero.Request) {
        
    }
    
    private(set) var isCalledFetchHeroes = false

    func fetchDatas(_ request: HomeModels.FetchHeroes.Request) {
        isCalledFetchHeroes = true

    }
}
