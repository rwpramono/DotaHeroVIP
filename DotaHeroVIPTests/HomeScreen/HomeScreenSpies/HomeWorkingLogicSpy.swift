//
//  HomeWorkingLogicSpy.swift
//  DotaHeroVIPTests
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation
@testable import DotaHeroVIP

final class HomeWorkingLogicSpy: HomeWorkingLogic {
    
    private(set) var isCalledFetchHeroes = false
        
    func fetchDatas(_ completion: @escaping ([DotaHeroResponse]?) -> Void) {
        isCalledFetchHeroes = true
        
    }
}
