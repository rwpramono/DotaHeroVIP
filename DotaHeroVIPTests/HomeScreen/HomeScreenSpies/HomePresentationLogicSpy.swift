//
//  HomePresentationLogicSpy.swift
//  DotaHeroVIPTests
//
//  Created by Rachmat Wahyu Pramono on 19/06/22.
//

import Foundation
@testable import DotaHeroVIP

final class HomePresentationLogicSpy: HomePresentationLogic {
    private(set) var isCalledPresentFetche = false

    func presentFetchedHeroes(_ response: HomeModels.FetchHeroes.Response) {
        isCalledPresentFetche = true
    }
}
